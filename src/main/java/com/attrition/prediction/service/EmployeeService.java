package com.attrition.prediction.service;

import java.util.List;

import com.attrition.prediction.model.Employee;



public interface EmployeeService {
	
	Employee findById(int id);
	
	Employee findBySSO(String sso);
	
	void saveEmployee(Employee employee);
	
	void updateEmployee(Employee employee);
	
	void deleteEmployeeBySSO(String sso);

	List<Employee> findAllEmployees(); 
	
	boolean isEmployeeSSOUnique(Integer id, String sso);

}