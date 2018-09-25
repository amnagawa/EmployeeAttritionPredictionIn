package com.attrition.prediction.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.attrition.prediction.model.Employee;

@Repository("employeeDao")
public class EmployeeDaoImpl extends AbstractDao<Integer, Employee> implements EmployeeDao {

	static final Logger logger = LoggerFactory.getLogger(EmployeeDaoImpl.class);
	
	public Employee findById(int id) {
		Employee employee = getByKey(id);
		if(employee!=null){
			Hibernate.initialize(employee.getEmployeeProfiles());
		}
		return employee;
	}

	public Employee findBySSO(String sso) {
		logger.info("SSO : {}", sso);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("ssoId", sso));
		Employee employee = (Employee)crit.uniqueResult();
		if(employee!=null){
			Hibernate.initialize(employee.getEmployeeProfiles());
		}
		return employee;
	}

	@SuppressWarnings("unchecked")
	public List<Employee> findAllEmployees() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstName"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Employee> emloyees = (List<Employee>) criteria.list();
		
		// No need to fetch userProfiles since we are not showing them on list page. Let them lazy load. 
		// Uncomment below lines for eagerly fetching of userProfiles if you want.
		/*
		for(User user : users){
			Hibernate.initialize(user.getUserProfiles());
		}*/
		return emloyees;
	}

	public void save(Employee employee) {
		persist(employee);
	}

	public void deleteBySSO(String sso) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("ssoId", sso));
		Employee employee = (Employee)crit.uniqueResult();
		delete(employee);
	}

}
