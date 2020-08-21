package poly.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.DAO.IDepartDAO;
import poly.entity.Depart;
import poly.service.IDepartService;


@Service
@Transactional
public class DepartService implements IDepartService {
	
	@Autowired
	IDepartDAO IDepartDAO;
	
	@Override
	public List<Depart> getAll() {
		// TODO Auto-generated method stub
		return IDepartDAO.getAll();
	}
	
	@Override
	public Depart findDepart(String id) {
		// TODO Auto-generated method stub
		return IDepartDAO.findDepart(id);
	}
	
	@Override
	public void addDepart(Depart depart) {
		IDepartDAO.addDepart(depart);
		
	}
	
	@Override
	public Depart updateDepart(Depart depart) {
		// TODO Auto-generated method stub
		return IDepartDAO.updateDepart(depart);
	}
	
	@Override
	public void deleteDepart(String id) {
		IDepartDAO.deleteDepart(id);
		
	}
	
	
}
