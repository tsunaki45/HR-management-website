package poly.DAO.impl;

import java.util.List;


import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.DAO.IStaffDAO;
import poly.entity.Staff;



@Repository
public class StaffDAO implements IStaffDAO {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Staff> findAll() {
		return factory.getCurrentSession().createQuery("FROM Staff").list();
	}
	
	@Override
	public Staff findStaff(String id) {
		return (Staff) factory.getCurrentSession().get(Staff.class, id);
	}
	
	@Override
	public void addStaff(Staff staff) {
		factory.getCurrentSession().saveOrUpdate(staff);
		
	}
	
	@Override
	public Staff updateStaff(Staff staff) {
		factory.getCurrentSession().update(staff);
		return staff;
	}
	
	@Override
	public void deleteStaff(String id) {
		Staff staff = (Staff) factory.getCurrentSession().load(Staff.class, id);
		if(null != staff) {
			this.factory.getCurrentSession().delete(staff);
		}
		
	}
		
	
}
