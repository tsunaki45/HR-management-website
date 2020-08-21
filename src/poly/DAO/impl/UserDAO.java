package poly.DAO.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import poly.DAO.IUserDAO;
import poly.entity.User;

@Repository
public class UserDAO implements IUserDAO {

	@Autowired
	SessionFactory factory;
	
	@Override
	@SuppressWarnings("unchecked")
	public List<User> findAll() {
		return factory.getCurrentSession().createQuery("FROM User").list();
	}
	
	@Override
	public User findUser(String username) {
		return (User) factory.getCurrentSession().get(User.class, username);
	}
	
	@Override
	public boolean checkLogin(String username, String password) {
		Session session = factory.openSession();
		String hql = "FROM User u WHERE u.username = :username AND u.password = :password";
		
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		
		@SuppressWarnings("unchecked")
		List<User> list = query.list();
		
		return list.isEmpty()? false:true;
	}
	
	@Override
	public void addUser(User user) {
		factory.getCurrentSession().saveOrUpdate(user);
		
	}
	
	@Override
	public User updateUser(User user) {
		factory.getCurrentSession().update(user);
		return user;
	}
	
	@Override
	public void deleteUser(String username) {
		User user =  (User) factory.getCurrentSession().load(User.class, username);
		if(null != user) {
			this.factory.getCurrentSession().delete(user);
		}
		
	}
}
