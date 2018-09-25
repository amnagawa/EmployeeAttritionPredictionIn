package com.attrition.prediction.service;

import java.util.List;

import com.attrition.prediction.model.EmployeeAttritionPrediction;


public interface EmployeeAttritionPredictionService {
	
	public void addEmpAttrPrediction(EmployeeAttritionPrediction empAttrPrediction);

	public List<EmployeeAttritionPrediction> getAllEmpAttrPredictions();

	public void deleteEmpAttrPrediction(Integer employeeId);

	public EmployeeAttritionPrediction getEmpAttrPrediction(int tradeId);

	public EmployeeAttritionPrediction updateEmpAttrPrediction(EmployeeAttritionPrediction employee);
}
