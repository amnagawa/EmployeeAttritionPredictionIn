package com.attrition.prediction.model;

import java.io.Serializable;

public enum EmployeeProfileType implements Serializable{
	USER("USER"),
	DBA("DBA"),
	ADMIN("ADMIN");
	
	String employeeProfileType;
	
	private EmployeeProfileType(String employeeProfileType){
		this.employeeProfileType = employeeProfileType;
	}
	
	public String getEmployeeProfileType(){
		return employeeProfileType;
	}
	
}
