package com.attrition.prediction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.attrition.prediction.dao.EmployeeAttritionPredictionDAO;
import com.attrition.prediction.model.EmployeeAttritionPrediction;


@Service
@Transactional
public class EmployeeAttritionPredictionServiceImpl implements EmployeeAttritionPredictionService {

	@Autowired
	private EmployeeAttritionPredictionDAO empAttrPredictionDAO;

	@Override
	@Transactional
	public void addEmpAttrPrediction(EmployeeAttritionPrediction empAttrPrediction) {
		empAttrPredictionDAO.addEmpAttrPrediction(empAttrPrediction);
	}

	@Override
	@Transactional
	public List<EmployeeAttritionPrediction> getAllEmpAttrPredictions() {
		return empAttrPredictionDAO.getAllEmpAttrPredictions();
	}

	@Override
	@Transactional
	public void deleteEmpAttrPrediction(Integer tradeId) {
		empAttrPredictionDAO.deleteEmpAttrPrediction(tradeId);
	}

	public EmployeeAttritionPrediction getEmpAttrPrediction(int tradeId) {
		return empAttrPredictionDAO.getEmpAttrPrediction(tradeId);
	}

	public EmployeeAttritionPrediction updateEmpAttrPrediction(EmployeeAttritionPrediction empAttrPrediction) {
		// TODO Auto-generated method stub
		return empAttrPredictionDAO.updateEmpAttrPrediction(empAttrPrediction);
	}

	public void setEmpAttrPredictionDAO(EmployeeAttritionPredictionDAO empAttrPredictionDAO) {
		this.empAttrPredictionDAO = empAttrPredictionDAO;
	}

}
