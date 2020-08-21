package poly.DAO;

import java.util.List;

import poly.entity.User;

public interface IUserDAO {
	
	public List<User> findAll();
	
	public User findUser(String username);
	
	public boolean checkLogin(String username, String password);
	
	public void addUser(User user);
	
	public User updateUser(User user);
	
	public void deleteUser(String username);
}
