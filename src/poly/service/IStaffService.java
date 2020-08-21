package poly.service;

import java.util.List;

import poly.entity.Staff;

public interface IStaffService {
	
	public List<Staff> findAll();
	
	public Staff findStaff(String id);
	
	public void addStaff(Staff staff);
	
	public Staff updateStaff(Staff staff);
	
	public void deleteStaff(String id);
}
