package poly.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.DAO.IUserDAO;

@Controller
@RequestMapping("/login/")

public class LoginController {
	
	@Autowired
	IUserDAO UserService;
	
	@Autowired
	HttpSession tpsession;
	
	@RequestMapping(value = "login")
	public String Login (ModelMap model, HttpServletRequest req) {
		String message = req.getParameter("message");
		
		if (message != null) {
			req.setAttribute("message", message);
		}
		return "login/login";
	}
	
	@RequestMapping(value = "check")
	public String checkLogin(ModelMap model,HttpServletRequest req) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		try {
			if(UserService.checkLogin(username, password)) {
				tpsession.setAttribute("USER", username);
				return "redirect:/admin/index.htm";
			}
			else {
				model.addAttribute("message","username or password invalid!");
			}
		} catch (Exception e) {
		}
		
		
		return "redirect:/login/login.htm";
		}
	
	@RequestMapping(value = "logout")
	public String logout() {
		tpsession.removeAttribute("USER");
		
		return "redirect:/login/login.htm";
	}
	
}
