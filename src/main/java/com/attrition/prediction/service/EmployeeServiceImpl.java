package com.attrition.prediction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.attrition.prediction.dao.EmployeeDao;
import com.attrition.prediction.model.Employee;



@Service("employeeService")
@Transactional
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeDao dao;

	@Autowired
    private PasswordEncoder passwordEncoder;
	
	public Employee findById(int id) {
		return dao.findById(id);
	}

	public Employee findBySSO(String sso) {
		Employee employee = dao.findBySSO(sso);
		return employee;
	}

	public void saveEmployee(Employee employee) {
		employee.setPassword(passwordEncoder.encode(employee.getPassword()));
		dao.save(employee);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateEmployee(Employee employee) {
		Employee entity = dao.findById(employee.getId());
		if(entity!=null){
			entity.setSsoId(employee.getSsoId());
			if(!employee.getPassword().equals(entity.getPassword())){
				entity.setPassword(passwordEncoder.encode(employee.getPassword()));
			}
			entity.setFirstName(employee.getFirstName());
			entity.setLastName(employee.getLastName());
			entity.setEmail(employee.getEmail());
			entity.setEmployeeProfiles(employee.getEmployeeProfiles());
		}
	}

	
	public void deleteEmployeeBySSO(String sso) {
		dao.deleteBySSO(sso);
	}

	public List<Employee> findAllEmployees() {
		return dao.findAllEmployees();
	}

	public boolean isEmployeeSSOUnique(Integer id, String sso) {
		Employee employee = findBySSO(sso);
		return ( employee == null || ((id != null) && (employee.getId() == id)));
	}
	
}
