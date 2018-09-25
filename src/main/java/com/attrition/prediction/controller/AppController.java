package com.attrition.prediction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.attrition.prediction.model.EmployeeAttritionPrediction;
import com.attrition.prediction.service.EmployeeAttritionPredictionService;




@RestController
public class AppController {

//	@Autowired
//	UserService userService;
//	
//	@Autowired
//	UserProfileService userProfileService;
//	
//	@Autowired
//	MessageSource messageSource;
//
//	@Autowired
//	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;
//	
//	@Autowired
//	AuthenticationTrustResolver authenticationTrustResolver;
	
	@Autowired
	private EmployeeAttritionPredictionService empAttrPredictionService;	
	
	
//	@RequestMapping(value = { "/list" }, method = RequestMethod.GET)
//	public String listUsers(ModelMap model) {
//
//		List<User> users = userService.findAllUsers();
//		List<TradeForecast> listTradeForecast = tradeForecastService.getAllTradeForecasts();
//		TradeForecast tradeForecast = new TradeForecast();
//		model.addAttribute("users", users);
//		model.addAttribute("loggedinuser", getPrincipal());
//		model.addAttribute("listTradeForecast", listTradeForecast);
//		model.addAttribute("tradeForecast", tradeForecast);
//		return "userslist";
//	}
//	
//	@RequestMapping(value = { "/aboutUs" }, method = RequestMethod.GET)
//	public String getAboutUs() {
//		return "aboutUs";
//	}	
//
//	 /**
//	 * This method will provide the medium to add a new user.
//	 */
//	 @RequestMapping(value = { "/newuser" }, method = RequestMethod.GET)
//	 public String newUser(ModelMap model) {
//	 User user = new User();
//	 model.addAttribute("user", user);
//	 model.addAttribute("edit", false);
//	 model.addAttribute("loggedinuser", getPrincipal());
//	 return "registration";
//	 }
//
//	/**
//	 * This method will be called on form submission, handling POST request for
//	 * saving user in database. It also validates the user input
//	 */
//	@RequestMapping(value = { "/newuser" }, method = RequestMethod.POST)
//	public String saveUser(@Valid User user, BindingResult result,
//			ModelMap model) {
//
//		if (result.hasErrors()) {
//			return "registration";
//		}
//
//		/*
//		 * Preferred way to achieve uniqueness of field [sso] should be implementing custom @Unique annotation 
//		 * and applying it on field [sso] of Model class [User].
//		 * 
//		 * Below mentioned peace of code [if block] is to demonstrate that you can fill custom errors outside the validation
//		 * framework as well while still using internationalized messages.
//		 * 
//		 */
//		if(!userService.isUserSSOUnique(user.getId(), user.getSsoId())){
//			FieldError ssoError =new FieldError("user","ssoId",messageSource.getMessage("non.unique.ssoId", new String[]{user.getSsoId()}, Locale.getDefault()));
//		    result.addError(ssoError);
//			return "registration";
//		}
//		
//		userService.saveUser(user);
//
//		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " registered successfully");
//		model.addAttribute("loggedinuser", getPrincipal());
//		//return "success";
//		return "registrationsuccess";
//	}
//
//
//	/**
//	 * This method will provide the medium to update an existing user.
//	 */
//	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
//	public String editUser(@PathVariable String ssoId, ModelMap model) {
//		User user = userService.findBySSO(ssoId);
//		model.addAttribute("user", user);
//		model.addAttribute("edit", true);
//		model.addAttribute("loggedinuser", getPrincipal());
//		return "registration";
//	}
//	
//	/**
//	 * This method will be called on form submission, handling POST request for
//	 * updating user in database. It also validates the user input
//	 */
//	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
//	public String updateUser(@Valid User user, BindingResult result,
//			ModelMap model, @PathVariable String ssoId) {
//
//		if (result.hasErrors()) {
//			return "registration";
//		}
//
//		userService.updateUser(user);
//
//		model.addAttribute("success", "User " + user.getFirstName() + " "+ user.getLastName() + " updated successfully");
//		model.addAttribute("loggedinuser", getPrincipal());
//		return "registrationsuccess";
//	}
//
//	
//	/**
//	 * This method will delete an user by it's SSOID value.
//	 */
//	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
//	public String deleteUser(@PathVariable String ssoId) {
//		userService.deleteUserBySSO(ssoId);
//		return "redirect:/list";
//	}
//	
//
//	/**
//	 * This method will provide UserProfile list to views
//	 */
//	@ModelAttribute("roles")
//	public List<UserProfile> initializeProfiles() {
//		return userProfileService.findAll();
//	}
//	
//	/**
//	 * This method handles Access-Denied redirect.
//	 */
//	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
//	public String accessDeniedPage(ModelMap model) {
//		model.addAttribute("loggedinuser", getPrincipal());
//		return "accessDenied";
//	}
//
//	/**
//	 * This method handles login GET requests.
//	 * If users is already logged-in and tries to goto login page again, will be redirected to list page.
//	 */
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String loginPage() {
//		if (isCurrentAuthenticationAnonymous()) {
//			return "login";
//	    } else {
//	    	return "redirect:/list";  
//	    }
//	}
//	
//	/**
//	 * This method handles logout requests.
//	 * Toggle the handlers if you are RememberMe functionality is useless in your app.
//	 */
//	@RequestMapping(value="/logout", method = RequestMethod.GET)
//	public String logoutPage (HttpServletRequest request, HttpServletResponse response){
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		if (auth != null){    
//			//new SecurityContextLogoutHandler().logout(request, response, auth);
//			persistentTokenBasedRememberMeServices.logout(request, response, auth);
//			SecurityContextHolder.getContext().setAuthentication(null);
//		}
//		return "redirect:/";
//	}
//
//	/**
//	 * This method returns the principal[user-name] of logged-in user.
//	 */
//	private String getPrincipal(){
//		String userName = null;
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//
//		if (principal instanceof UserDetails) {
//			userName = ((UserDetails)principal).getUsername();
//		} else {
//			userName = principal.toString();
//		}
//		return userName;
//	}
//	
//	/**
//	 * This method returns true if users is already authenticated [logged-in], else false.
//	 */
//	private boolean isCurrentAuthenticationAnonymous() {
//	    final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//	    return authenticationTrustResolver.isAnonymous(authentication);
//	}
//	
//	@RequestMapping(value = "/newTradeForecast", method = RequestMethod.GET)
//	public ModelAndView newTradeForecast(ModelAndView model) {
//		TradeForecast tradeForecast = new TradeForecast();
//		model.addObject("tradeForecast", tradeForecast);
//		model.setViewName("tradeForecastForm");
//		return model;
//	}
//
//	@RequestMapping(value = "/saveTradeForecast", method = RequestMethod.POST)
//	public ModelAndView saveTradeForecast(@ModelAttribute TradeForecast tradeForecast) {
//		System.out.println(tradeForecast.getTradeId());
//		if (tradeForecast.getTradeId() == 0) { // if tradeForecast id is 0 then creating the
//			// tradeForecast other updating the tradeForecast
//			tradeForecastService.addTradeForecast(tradeForecast);
//		} else {
//			tradeForecastService.updateTradeForecast(tradeForecast);
//		}
//		return new ModelAndView("redirect:/list");
//	}
//
//	@RequestMapping(value = "/deleteTradeForecast", method = RequestMethod.GET)
//	public ModelAndView deleteTradeForecast(HttpServletRequest request) {
//		int tradeId = Integer.parseInt(request.getParameter("id"));
//		tradeForecastService.deleteTradeForecast(tradeId);
//		return new ModelAndView("redirect:/list");
//	}
//
//	@RequestMapping(value = "/editTradeForecast", method = RequestMethod.GET)
//	public ModelAndView editTradeForecast(HttpServletRequest request) {
//		int tradeId = Integer.parseInt(request.getParameter("id"));
//		TradeForecast tradeForecast = tradeForecastService.getTradeForecast(tradeId);
//		ModelAndView model = new ModelAndView("tradeForecastForm");
//		model.addObject("tradeForecast", tradeForecast);
//
//		return model;
//	}
	
	//-------------------Retrieve All EmployeeAttritionPrediction--------------------------------------------------------
    
    @RequestMapping(value = "/empAttrPrediction", method = RequestMethod.GET)
    public ResponseEntity<List<EmployeeAttritionPrediction>> listAllEmpAttrPredictions() {
        List<EmployeeAttritionPrediction> empAttrPredictions = empAttrPredictionService.getAllEmpAttrPredictions();
        if(empAttrPredictions.isEmpty()){
            return new ResponseEntity<List<EmployeeAttritionPrediction>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<EmployeeAttritionPrediction>>(empAttrPredictions, HttpStatus.OK);
    }
 
 
    
    //-------------------Retrieve Single EmployeeAttritionPrediction--------------------------------------------------------
     
    @RequestMapping(value = "/empAttrPrediction/{tradeId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<EmployeeAttritionPrediction> getTradeForecast(@PathVariable("tradeId") int tradeId) {
        System.out.println("Fetching User with id " + tradeId);
        EmployeeAttritionPrediction empAttrPrediction = empAttrPredictionService.getEmpAttrPrediction(tradeId);
        if (empAttrPrediction == null) {
            System.out.println("EmployeeAttritionPrediction with id " + tradeId + " not found");
            return new ResponseEntity<EmployeeAttritionPrediction>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<EmployeeAttritionPrediction>(empAttrPrediction, HttpStatus.OK);
    }
 
     
     
    //-------------------Create a EmployeeAttritionPrediction--------------------------------------------------------
     
    @RequestMapping(value = "/empAttrPrediction", method = RequestMethod.POST)
    public ResponseEntity<Void> createTradeForecast(@RequestBody EmployeeAttritionPrediction empAttrPrediction,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating TradeForecast " + empAttrPrediction.getTradeId());
 
//        if (tradeForecast.isUserExist(tradeForecast)) {
//            System.out.println("A User with name " + tradeForecast.getUsername() + " already exist");
//            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
//        }
 
        empAttrPredictionService.addEmpAttrPrediction(empAttrPrediction);
 
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/empAttrPrediction/{tradeId}").buildAndExpand(empAttrPrediction.getTradeId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
 
    
     
    //------------------- Update a EmployeeAttritionPrediction --------------------------------------------------------
     
    @RequestMapping(value = "/empAttrPrediction/{tradeId}", method = RequestMethod.PUT)
    public ResponseEntity<EmployeeAttritionPrediction> updateTradeForecast(@PathVariable("tradeId") int tradeId, @RequestBody EmployeeAttritionPrediction empAttrPrediction) {
        System.out.println("Updating EmployeeAttritionPredictions " + tradeId);
         
        EmployeeAttritionPrediction currentEmpAttrPrediction = empAttrPredictionService.getEmpAttrPrediction(tradeId);
         
        if (currentEmpAttrPrediction==null) {
            System.out.println("EmployeeAttritionPrediction with id " + tradeId + " not found");
            return new ResponseEntity<EmployeeAttritionPrediction>(HttpStatus.NOT_FOUND);
        }
 
        currentEmpAttrPrediction.setTradeDate(empAttrPrediction.getTradeDate());
        currentEmpAttrPrediction.setCompany(empAttrPrediction.getCompany());
        currentEmpAttrPrediction.setStatus(empAttrPrediction.getStatus());
        currentEmpAttrPrediction.setCpm(empAttrPrediction.getCpm());
        currentEmpAttrPrediction.setOrderType(empAttrPrediction.getOrderType());
        currentEmpAttrPrediction.setTargetValue(empAttrPrediction.getTargetValue());
        currentEmpAttrPrediction.setBuySellValue(empAttrPrediction.getBuySellValue());
        currentEmpAttrPrediction.setProfitLossValue(empAttrPrediction.getProfitLossValue());
        currentEmpAttrPrediction.setStopLossValue(empAttrPrediction.getStopLossValue());
        currentEmpAttrPrediction.setResult(empAttrPrediction.getResult());
        currentEmpAttrPrediction.setTradeResultDate(empAttrPrediction.getTradeResultDate());
        currentEmpAttrPrediction.setComments(empAttrPrediction.getComments());
      
         
        empAttrPredictionService.updateEmpAttrPrediction(currentEmpAttrPrediction);
        return new ResponseEntity<EmployeeAttritionPrediction>(currentEmpAttrPrediction, HttpStatus.OK);
    }
 
    
    
    //------------------- Delete a EmployeeAttritionPrediction --------------------------------------------------------
     
    @RequestMapping(value = "/empAttrPrediction/{tradeId}", method = RequestMethod.DELETE)
    public ResponseEntity<EmployeeAttritionPrediction> deleteTradeForecast(@PathVariable("tradeId") int tradeId) {
        System.out.println("Fetching & Deleting EmpAttrPrediction with id " + tradeId);
 
        EmployeeAttritionPrediction empAttrPrediction = empAttrPredictionService.getEmpAttrPrediction(tradeId);
        if (empAttrPrediction == null) {
            System.out.println("Unable to delete. EmployeeAttritionPrediction with id " + tradeId + " not found");
            return new ResponseEntity<EmployeeAttritionPrediction>(HttpStatus.NOT_FOUND);
        }
 
        empAttrPredictionService.deleteEmpAttrPrediction((int)tradeId);
        return new ResponseEntity<EmployeeAttritionPrediction>(HttpStatus.NO_CONTENT);
    }


}