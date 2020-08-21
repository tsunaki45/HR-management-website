package poly.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.entity.User;
import poly.service.IUserService;

@Controller
@RequestMapping(value = "admin/user/")
public class UserController {
	
	@Autowired
	IUserService UserService;
	
	//show list form
	@RequestMapping(value = "ListUser")
	public String list(HttpServletRequest req) {
		try {
			
			String message = req.getParameter("message");
			String alert = req.getParameter("alert");
			
			req.setAttribute("users", UserService.findAll());
			
			if(message != null) {
				req.setAttribute("message", message.replaceAll("_", "."));
				req.setAttribute("alert", alert);
			}
			
		} catch (Exception e) {
		}
		return "admin/user/ListUser";
	}
	//show add and edit form
	@RequestMapping(value = "AddUser")
	public String add(Model model) {
		model.addAttribute("check",false);
		model.addAttribute("users", new User());
		
		return "admin/user/AddUser";
	}
	
	@RequestMapping(value = "EditUser")
	public String edit(ModelMap model, @ModelAttribute("username") String username) {
		model.addAttribute("check",true);
		model.addAttribute("users", UserService.findUser(username));
		
		return "admin/user/EditUser";
	}
	
	//action save, edit, delete data
	@RequestMapping(value = "save")
	public String save(ModelMap model, @ModelAttribute("users") User user, BindingResult bindingResult) {
		check(user, bindingResult);
		if(bindingResult.hasErrors()) {
			return "admin/user/AddUser";
		}
		else {
			try {
				UserService.addUser(user);
				model.addAttribute("message", "user_edit_message_success");
				model.addAttribute("alert", "success");
			} catch (Exception e) {
				model.addAttribute("message", "user_edit_message_fail");
				model.addAttribute("alert", "danger");
			}
			return "redirect:/admin/user/ListUser.htm";
		}
	}
	
	@RequestMapping(value = "update")
	public String update(Model model, @ModelAttribute("users") User user, BindingResult bindingResult) {
		checkEdit(user, bindingResult);
		if(bindingResult.hasErrors()) {
			return "admin/user/EditUser";
		}
		else {
			try {
				UserService.updateUser(user);
				model.addAttribute("message", "user_edit_message_success");
				model.addAttribute("alert", "success");
			} catch (Exception e) {
				model.addAttribute("message", "user_edit_message_fail");
				model.addAttribute("alert", "danger");
			}
			return "redirect:/admin/user/ListUser.htm";
		}
	}
	
	@RequestMapping(value = "DeleteUser", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest req) {
		try {
			String username = req.getParameter("username");
			UserService.deleteUser(username);
			model.addAttribute("message", "user_delete_message_success");
			model.addAttribute("alert", "success");
		} catch (Exception e) {
			model.addAttribute("message", "user_delete_message_fail");
			model.addAttribute("alert", "danger");
		}
		return "redirect:/admin/user/ListUser.htm";
	}
	
	//validator
	private void check(User user, BindingResult bindingResult) {
		try {
			if(user.getUsername().trim().length()==0) {
				bindingResult.rejectValue("username", "user.validation.notempty.username");
			}
			else {
				List<User> temp = UserService.findAll();
				for(User tempU : temp) {
					if(tempU.getUsername().equals(user.getUsername())) {
						bindingResult.rejectValue("username", "user.validation.exist.username");
						break;
					}
				}
			}
			
			if(user.getPassword().trim().length()==0) {
				bindingResult.rejectValue("password", "user.validation.notempty.password");
			}
			if(user.getFullname().trim().length()==0) {
				bindingResult.rejectValue("fullname", "user.validation.notempty.fullname");
			}
		} catch (Exception e) {
		}
	}
	
	private void checkEdit(User user, BindingResult bindingResult) {
		try {

			if(user.getPassword().trim().length()==0) {
				bindingResult.rejectValue("password", "user.validation.notempty.password");
			}
			
			if(user.getFullname().trim().length()==0) {
				bindingResult.rejectValue("fullname", "user.validation.notempty.fullname");
			}
		} catch (Exception e) {
		}
	}
}


