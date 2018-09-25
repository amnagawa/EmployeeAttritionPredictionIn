package com.attrition.prediction.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.attrition.prediction.model.EmployeeAttritionPrediction;

@Repository
public class EmployeeAttritionPredictionDAOImpl implements EmployeeAttritionPredictionDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addEmpAttrPrediction(EmployeeAttritionPrediction empAttrPrediction) {
		sessionFactory.getCurrentSession().saveOrUpdate(empAttrPrediction);
		
	}

	@SuppressWarnings("unchecked")
	public List<EmployeeAttritionPrediction> getAllEmpAttrPredictions() {
		
//		return sessionFactory.getCurrentSession().createQuery("from TradeForecast")
//		.list();
		
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(EmployeeAttritionPrediction.class);
		criteria.addOrder(Order.desc("tradeDate"));
		return criteria.list();
	}

	@Override
	public void deleteEmpAttrPrediction(Integer tradeId) {
		EmployeeAttritionPrediction empAttrPrediction = (EmployeeAttritionPrediction) sessionFactory.getCurrentSession().load(
				EmployeeAttritionPrediction.class, tradeId);
		if (null != empAttrPrediction) {
			this.sessionFactory.getCurrentSession().delete(empAttrPrediction);
		}
		
	}

	@Override
	public EmployeeAttritionPrediction updateEmpAttrPrediction(EmployeeAttritionPrediction empAttrPrediction) {
		sessionFactory.getCurrentSession().update(empAttrPrediction);
		return empAttrPrediction;
	}

	@Override
	public EmployeeAttritionPrediction getEmpAttrPrediction(int tradeId) {
		return (EmployeeAttritionPrediction) sessionFactory.getCurrentSession().get(
				EmployeeAttritionPrediction.class, tradeId);
	}

	
	
}