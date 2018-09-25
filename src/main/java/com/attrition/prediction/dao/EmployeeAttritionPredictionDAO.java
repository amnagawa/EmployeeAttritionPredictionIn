package com.attrition.prediction.dao;

import java.util.List;

import com.attrition.prediction.model.EmployeeAttritionPrediction;

public interface EmployeeAttritionPredictionDAO {

	public void addEmpAttrPrediction(EmployeeAttritionPrediction empAttrPrediction);

	public List<EmployeeAttritionPrediction> getAllEmpAttrPredictions();

	public void deleteEmpAttrPrediction(Integer tradeId);

	public EmployeeAttritionPrediction updateEmpAttrPrediction(EmployeeAttritionPrediction empAttrPrediction);

	public EmployeeAttritionPrediction getEmpAttrPrediction(int tradeId);
}
