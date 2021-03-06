package com.attrition.prediction.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.attrition.prediction.model.EmployeeProfile;


@Repository("employeeProfileDao")
public class EmployeeProfileDaoImpl extends AbstractDao<Integer, EmployeeProfile>implements EmployeeProfileDao{

	public EmployeeProfile findById(int id) {
		return getByKey(id);
	}

	public EmployeeProfile findByType(String type) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("type", type));
		return (EmployeeProfile) crit.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<EmployeeProfile> findAll(){
		Criteria crit = createEntityCriteria();
		crit.addOrder(Order.asc("type"));
		return (List<EmployeeProfile>)crit.list();
	}
	
}
