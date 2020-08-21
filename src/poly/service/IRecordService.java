package poly.service;

import java.util.List;

import poly.entity.Record;

public interface IRecordService {
	public List<Record> findAll();
	
	public List<Object[]> findAllStaffReport();
	
	public List<Object[]> findAllDepartReport();
	
	public List<Object[]> findAllExcellentStaff();
	
	public Record findRecord(Long id);
	
	public void addRecored(Record record);
	
	public Record updateRecord(Record record);
	
	public void deleteRecord(Long id);
}
