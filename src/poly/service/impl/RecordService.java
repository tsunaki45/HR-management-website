package poly.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.DAO.IRecordDAO;
import poly.entity.Record;
import poly.service.IRecordService;

@Service
@Transactional
public class RecordService implements IRecordService {
	
	@Autowired
	IRecordDAO RecordDAO;
	
	@Override
	public List<Record> findAll() {
		
		return RecordDAO.findAll();
	}
	
	@Override
	public List<Object[]> findAllExcellentStaff() {
		// TODO Auto-generated method stub
		return RecordDAO.findAllExcellentStaff();
	}
	
	@Override
	public List<Object[]> findAllDepartReport() {
		// TODO Auto-generated method stub
		return RecordDAO.findAllDepartReport();
	}
	
	@Override
	public List<Object[]> findAllStaffReport() {
		// TODO Auto-generated method stub
		return RecordDAO.findAllStaffReport();
	}
	
	@Override
	public Record findRecord(Long id) {

		return RecordDAO.findRecord(id);
	}
	
	@Override
	public void addRecored(Record record) {
		
		RecordDAO.addRecored(record);
	}
	
	@Override
	public Record updateRecord(Record record) {

		return RecordDAO.updateRecord(record);
	}
	
	@Override
	public void deleteRecord(Long id) {

		RecordDAO.deleteRecord(id);
	}
}
