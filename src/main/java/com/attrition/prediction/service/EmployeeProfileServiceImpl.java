package com.attrition.prediction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.attrition.prediction.dao.EmployeeProfileDao;
import com.attrition.prediction.model.EmployeeProfile;



@Service("employeeProfileService")
@Transactional
public class EmployeeProfileServiceImpl implements EmployeeProfileService{
	
	@Autowired
	EmployeeProfileDao dao;
	
	public EmployeeProfile findById(int id) {
		return dao.findById(id);
	}

	public EmployeeProfile findByType(String type){
		return dao.findByType(type);
	}

	public List<EmployeeProfile> findAll() {
		return dao.findAll();
	}
}
