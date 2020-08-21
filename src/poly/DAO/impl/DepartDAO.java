package poly.DAO.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.DAO.IDepartDAO;
import poly.entity.Depart;

@Repository
public class DepartDAO implements IDepartDAO {
	
	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Depart> getAll() {
		return factory.getCurrentSession().createQuery("FROM Depart").list();
	}
	
	@Override
	public Depart findDepart(String id) {
		return (Depart) factory.getCurrentSession().get(Depart.class,id);
	}
	
	@Override
	public void addDepart(Depart depart) {
		factory.getCurrentSession().saveOrUpdate(depart);
	}
	
	@Override
	public Depart updateDepart(Depart depart) {
		factory.getCurrentSession().update(depart);
		return depart;
	}
	
	@Override
	public void deleteDepart(String id) {
		Depart depart = (Depart) factory.getCurrentSession().load(Depart.class, id);
		if(null != depart) {
			this.factory.getCurrentSession().delete(depart);
		}
		
	}
}
