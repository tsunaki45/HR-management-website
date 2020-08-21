package poly.DAO;

import java.util.List;

import poly.entity.Depart;

public interface IDepartDAO {

	public List<Depart> getAll();
	
	public Depart findDepart(String id);
	
	public void addDepart(Depart depart);
	
	public Depart updateDepart(Depart depart);
	
	public void deleteDepart(String id);
}
