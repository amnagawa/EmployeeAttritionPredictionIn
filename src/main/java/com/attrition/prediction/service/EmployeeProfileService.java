package com.attrition.prediction.service;

import java.util.List;

import com.attrition.prediction.model.EmployeeProfile;



public interface EmployeeProfileService {

	EmployeeProfile findById(int id);

	EmployeeProfile findByType(String type);
	
	List<EmployeeProfile> findAll();
	
}
