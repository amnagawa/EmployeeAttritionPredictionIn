package com.attrition.prediction.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.attrition.prediction.model.Employee;
import com.attrition.prediction.model.EmployeeProfile;
import com.attrition.prediction.service.EmployeeService;


@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{

	static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@Transactional(readOnly=true)
	public UserDetails loadUserByUsername(String ssoId)
			throws UsernameNotFoundException {
		Employee employee = employeeService.findBySSO(ssoId);
		logger.info("Employee : {}", employee);
		if(employee==null){
			logger.info("Employee not found");
			throw new UsernameNotFoundException("Employeename not found");
		}
			return new org.springframework.security.core.userdetails.User(employee.getSsoId(), employee.getPassword(), 
				 true, true, true, true, getGrantedAuthorities(employee));
	}

	
	private List<GrantedAuthority> getGrantedAuthorities(Employee employee){
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for(EmployeeProfile employeeProfile : employee.getEmployeeProfiles()){
			logger.info("EmployeeProfile : {}", employeeProfile);
			authorities.add(new SimpleGrantedAuthority("ROLE_"+employeeProfile.getType()));
		}
		logger.info("authorities : {}", authorities);
		return authorities;
	}
	
}
