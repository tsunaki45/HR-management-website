package poly.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.DAO.IUserDAO;
import poly.entity.User;
import poly.service.IUserService;

@Service
@Transactional
public class UserService implements IUserService {
	
	@Autowired
	IUserDAO IUserDAO;
	
	@Override
	public List<User> findAll() {
		return IUserDAO.findAll();
	}
	
	@Override
	public User findUser(String username) {
		return IUserDAO.findUser(username);
	}
	
	@Override
	public boolean checkLogin(String username, String password) {
		return checkLogin(username, password);
	}
	
	@Override
	public void addUser(User user) {
		 IUserDAO.addUser(user);
		
	}
	
	@Override
	public User updateUser(User user) {
		return IUserDAO.updateUser(user);
	}
	
	@Override
	public void deleteUser(String username) {
		IUserDAO.deleteUser(username);
		
	}
}
