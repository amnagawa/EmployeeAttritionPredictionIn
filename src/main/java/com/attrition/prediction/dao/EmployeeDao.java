package com.attrition.prediction.dao;

import java.util.List;

import com.attrition.prediction.model.Employee;

public interface EmployeeDao {

	Employee findById(int id);
	
	Employee findBySSO(String sso);
	
	void save(Employee employee);
	
	void deleteBySSO(String sso);
	
	List<Employee> findAllEmployees();

}

