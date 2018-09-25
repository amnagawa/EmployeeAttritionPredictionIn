package com.attrition.prediction.dao;

import java.util.List;

import com.attrition.prediction.model.EmployeeProfile;


public interface EmployeeProfileDao {

	List<EmployeeProfile> findAll();
	
	EmployeeProfile findByType(String type);
	
	EmployeeProfile findById(int id);
}
