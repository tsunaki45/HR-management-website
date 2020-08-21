package poly.service;

import java.util.List;

import poly.entity.Depart;

public interface IDepartService {
	
	public List<Depart> getAll();
	
	public Depart findDepart(String id);
	
	public void addDepart(Depart depart);
	
	public Depart updateDepart(Depart depart);
	
	public void deleteDepart(String id);
}
