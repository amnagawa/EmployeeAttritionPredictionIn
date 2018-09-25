package com.attrition.prediction.controller;


import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.attrition.prediction.model.EmployeeAttritionPrediction;
import com.attrition.prediction.model.Employee;
import com.attrition.prediction.model.EmployeeProfile;
import com.attrition.prediction.service.EmployeeAttritionPredictionService;
import com.attrition.prediction.service.EmployeeProfileService;
import com.attrition.prediction.service.EmployeeService;



@Controller
@RequestMapping("/")
@SessionAttributes("roles")
public class IndexController {
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	EmployeeProfileService userProfileService;
	
	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
	
	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;
	
	@Autowired
	private EmployeeAttritionPredictionService empAttrPredictionService;

	  @RequestMapping(value = "/")
		public ModelAndView listTradeForecast(ModelAndView model) throws IOException {
			List<EmployeeAttritionPrediction> listEmpAttrPrediction = empAttrPredictionService.getAllEmpAttrPredictions();
			EmployeeAttritionPrediction empAttrPrediction = new EmployeeAttritionPrediction();
			model.addObject("listEmpAttrPrediction", listEmpAttrPrediction);
			model.addObject("empAttrPrediction", empAttrPrediction);
			model.setViewName("empAttrPredictionDemo");
			return model;
		}	
	  
//	  @RequestMapping(method = RequestMethod.GET)
//	    public String getIndexPage() {
//	        return "ShareTrendsManagement";
//	    }
	  
	  @RequestMapping(value = { "/empAttrPredictionList" }, method = RequestMethod.GET)
		public String getShareTradePage() {
			return "ShareTrendsManagement";
		}
	  
	  @RequestMapping(value = { "/list" }, method = RequestMethod.GET)
		public String listUsers(ModelMap model) {

			List<Employee> employees = employeeService.findAllEmployees();
			List<EmployeeAttritionPrediction> listEmpAttrPrediction = empAttrPredictionService.getAllEmpAttrPredictions();
			EmployeeAttritionPrediction empAttrPrediction = new EmployeeAttritionPrediction();
			model.addAttribute("employees", employees);
			model.addAttribute("loggedinuser", getPrincipal());
			model.addAttribute("listEmpAttrPrediction", listEmpAttrPrediction);
			model.addAttribute("empAttrPrediction", empAttrPrediction);
			return "empAttrPredictionList";
		}
		
		@RequestMapping(value = { "/aboutUs" }, method = RequestMethod.GET)
		public String getAboutUs() {
			return "aboutUs";
		}	

		 /**
		 * This method will provide the medium to add a new user.
		 */
		 @RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
		 public String newUser(ModelMap model) {
		 Employee employee = new Employee();
		 model.addAttribute("employee", employee);
		 model.addAttribute("edit", false);
		 model.addAttribute("loggedinuser", getPrincipal());
		 return "registration";
		 }

		/**
		 * This method will be called on form submission, handling POST request for
		 * saving user in database. It also validates the user input
		 */
		@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
		public String saveUser(@Valid Employee employee, BindingResult result,
				ModelMap model) {

			if (result.hasErrors()) {
				return "registration";
			}

			/*
			 * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation 
			 * and applying it on field [sso] of Model class [User].
			 * 
			 * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
			 * framework as well while still using internationalized messages.
			 * 
			 */
			if(!employeeService.isEmployeeSSOUnique(employee.getId(), employee.getSsoId())){
				FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{employee.getSsoId()}, Locale.getDefault()));
			    result.addError(ssoError);
				return "registration";
			}
			
			employeeService.saveEmployee(employee);

			model.addAttribute("success", "Employee " + employee.getFirstName() + " "+ employee.getLastName() + " registered successfully");
			model.addAttribute("loggedinuser", getPrincipal());
			//return "success";
			return "registrationsuccess";
		}


		/**
		 * This method will provide the medium to update an existing user.
		 */
		@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
		public String editEmployee(@PathVariable String ssoId, ModelMap model) {
			Employee employee = employeeService.findBySSO(ssoId);
			model.addAttribute("user", employee);
			model.addAttribute("edit", true);
			model.addAttribute("loggedinuser", getPrincipal());
			return "registration";
		}
		
		/**
		 * This method will be called on form submission, handling POST request for
		 * updating user in database. It also validates the user input
		 */
		@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
		public String updateUser(@Valid Employee employee, BindingResult result,
				ModelMap model, @PathVariable String ssoId) {

			if (result.hasErrors()) {
				return "registration";
			}

			employeeService.updateEmployee(employee);

			model.addAttribute("success", "Employee " + employee.getFirstName() + " "+ employee.getLastName() + " updated successfully");
			model.addAttribute("loggedinuser", getPrincipal());
			return "registrationsuccess";
		}

		
		/**
		 * This method will delete an user by it's SSOID value.
		 */
		@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
		public String deleteUser(@PathVariable String ssoId) {
			employeeService.deleteEmployeeBySSO(ssoId);
			return "redirect:/list";
		}
		

		/**
		 * This method will provide UserProfile list to views
		 */
		@ModelAttribute("roles")
		public List<EmployeeProfile> initializeProfiles() {
			return userProfileService.findAll();
		}
		
		/**
		 * This method handles Access-Denied redirect.
		 */
		@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
		public String accessDeniedPage(ModelMap model) {
			model.addAttribute("loggedinuser", getPrincipal());
			return "accessDenied";
		}

		/**
		 * This method handles login GET requests.
		 * If users is already logged-in and tries to goto login page again, will be redirected to list page.
		 */
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String loginPage() {
			if (isCurrentAuthenticationAnonymous()) {
				return "login";
		    } else {
		    	return "redirect:/list";  
		    }
		}
		
		/**
		 * This method handles logout requests.
		 * Toggle the handlers if you are RememberMe functionality is useless in your app.
		 */
		@RequestMapping(value="/logout", method = RequestMethod.GET)
		public String logoutPage (HttpServletRequest request, HttpServletResponse response){
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth != null){    
				//new SecurityContextLogoutHandler().logout(request, response, auth);
				persistentTokenBasedRememberMeServices.logout(request, response, auth);
				SecurityContextHolder.getContext().setAuthentication(null);
			}
			return "redirect:/";
		}

		/**
		 * This method returns the principal[user-name] of logged-in user.
		 */
		private String getPrincipal(){
			String userName = null;
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

			if (principal instanceof UserDetails) {
				userName = ((UserDetails)principal).getUsername();
			} else {
				userName = principal.toString();
			}
			return userName;
		}
		
		/**
		 * This method returns true if users is already authenticated [logged-in], else false.
		 */
		private boolean isCurrentAuthenticationAnonymous() {
		    final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		    return authenticationTrustResolver.isAnonymous(authentication);
		}
		
		@RequestMapping(value = "/newEmpAttrPrediction", method = RequestMethod.GET)
		public ModelAndView newTradeForecast(ModelAndView model) {
			EmployeeAttritionPrediction empAttrPrediction = new EmployeeAttritionPrediction();
			model.addObject("empAttrPrediction", empAttrPrediction);
			model.setViewName("empAttrPredictionForm");
			return model;
		}

		@RequestMapping(value = "/saveEmpAttrPrediction", method = RequestMethod.POST)
		public ModelAndView saveEmpAttrPrediction(@ModelAttribute EmployeeAttritionPrediction empAttrPrediction) {
			System.out.println(empAttrPrediction.getTradeId());
			if (empAttrPrediction.getTradeId() == 0) { // if tradeForecast id is 0 then creating the
				// tradeForecast other updating the tradeForecast
				empAttrPredictionService.addEmpAttrPrediction(empAttrPrediction);
			} else {
				empAttrPredictionService.updateEmpAttrPrediction(empAttrPrediction);
			}
			return new ModelAndView("redirect:/list");
		}

		@RequestMapping(value = "/deleteEmpAttrPrediction", method = RequestMethod.GET)
		public ModelAndView deleteTradeForecast(HttpServletRequest request) {
			int tradeId = Integer.parseInt(request.getParameter("id"));
			empAttrPredictionService.deleteEmpAttrPrediction(tradeId);
			return new ModelAndView("redirect:/list");
		}

		@RequestMapping(value = "/editEmpAttrPrediction", method = RequestMethod.GET)
		public ModelAndView editTradeForecast(HttpServletRequest request) {
			int tradeId = Integer.parseInt(request.getParameter("id"));
			EmployeeAttritionPrediction empAttrPrediction = empAttrPredictionService.getEmpAttrPrediction(tradeId);
			ModelAndView model = new ModelAndView("tradeForecastForm");
			model.addObject("empAttrPrediction", empAttrPrediction);

			return model;
		}

}