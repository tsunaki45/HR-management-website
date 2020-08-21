package poly.service;

import java.util.List;

import poly.entity.User;

public interface IUserService {
	public List<User> findAll();
	
	public User findUser(String username);
	
	public boolean checkLogin(String username, String password);
	
	public void addUser(User user);
	
	public User updateUser(User user);
	
	public void deleteUser(String username);
}
