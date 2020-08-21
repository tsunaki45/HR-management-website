package poly.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.service.IRecordService;

@Controller
@RequestMapping("/admin")
public class HomeController {
	
	@Autowired
	IRecordService recordService;
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest req) {
		
		req.setAttribute("ExStaffs", recordService.findAllExcellentStaff());
		
		return "admin/index";
	}
	
	@RequestMapping(value = "userCount")
	public String userCount(Model model) {
		
		return "redirect:/admin/index.htm";
	}

	@RequestMapping(value = "departCount")
	public String departCount(Model model) {
		
		return "redirect:/admin/index.htm";
	}
	
	@RequestMapping(value = "staffCount")
	public String staffCount(Model model) {
		
		return "redirect:/admin/index.htm";
	}
	
	@RequestMapping(value = "recordCount")
	public String recordCount(Model model) {
		
		return "redirect:/admin/index.htm";
	}
}
