package poly.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.DAO.IStaffDAO;
import poly.entity.Staff;
import poly.service.IStaffService;

@Service
@Transactional
public class StaffService implements IStaffService {
	
	@Autowired
	IStaffDAO IStaffDAO;
	
	@Override
	public List<Staff> findAll() {
		
		return IStaffDAO.findAll();
	}
	
	@Override
	public Staff findStaff(String id) {
		
		return IStaffDAO.findStaff(id);
	}
	
	@Override
	public void addStaff(Staff staff) {
		IStaffDAO.addStaff(staff);
		
	}
	
	@Override
	public Staff updateStaff(Staff staff) {
		return IStaffDAO.updateStaff(staff);
	}
	
	@Override
	public void deleteStaff(String id) {
		IStaffDAO.deleteStaff(id);
		
	}
}
