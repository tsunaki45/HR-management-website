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

import poly.entity.Depart;
import poly.service.IDepartService;

@Controller
@RequestMapping(value = "admin/depart/")
public class DepartController{
	
	@Autowired
	IDepartService DepartService;
	
	@RequestMapping(value = "ListDepart")
	public String list(HttpServletRequest req){
		try {
			
			String message = req.getParameter("message");
			String alert = req.getParameter("alert");
			
			req.setAttribute("departs", DepartService.getAll());
			
			if(message != null) {
				req.setAttribute("message", message.replaceAll("_", "."));
				req.setAttribute("alert", alert);
			}
			
		} catch (Exception e) {
		}
		return "admin/depart/ListDepart";
	}
	
	@RequestMapping(value = "AddDepart")
	public String add(ModelMap model, @ModelAttribute("departs") Depart depart){
		model.addAttribute("check", false);
		model.addAttribute("departs", new Depart());
		return "admin/depart/AddDepart";
	}
	
	@RequestMapping(value = "EditDepart")
	public String edit(ModelMap model, @ModelAttribute("id") String id){
		model.addAttribute("check", false);
		model.addAttribute("departs", DepartService.findDepart(id));
		return "admin/depart/EditDepart";
	}
	
	@RequestMapping(value = "save")
	public String save(Model model,@ModelAttribute("departs") Depart depart, BindingResult bindingResult){
		check(depart, bindingResult);
		if(bindingResult.hasErrors()) {
			return "admin/depart/AddDepart";
		}
		else {
			try {
				DepartService.addDepart(depart);
				model.addAttribute("message", "depart_edit_message_success");
				model.addAttribute("alert", "success");
				
			}
			catch (Exception e) {
				model.addAttribute("message", "depart_edit_message_fail");
				model.addAttribute("alert", "danger");
				
			}
			return "redirect:/admin/depart/ListDepart.htm";
		}
		
	}
	
	@RequestMapping(value = "update")
	public String update(Model model,@ModelAttribute("departs") Depart depart, BindingResult bindingResult) {
		checkEdit(depart, bindingResult);
		if(bindingResult.hasErrors()) {
			return "admin/depart/EditDepart";
		}
		else {
			try {
				DepartService.updateDepart(depart);
				model.addAttribute("message", "depart_edit_message_success");
				model.addAttribute("alert", "success");
			}
			catch (Exception e) {
				model.addAttribute("message", "depart_edit_message_fail");
				model.addAttribute("alert", "danger");
			}
			return "redirect:/admin/depart/ListDepart.htm";
		}
		
	}
	
	@RequestMapping(value = "DeleteDepart", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest req) {
		try {
			String id = req.getParameter("id");
			DepartService.deleteDepart(id);
			model.addAttribute("message", "depart_delete_message_success");
			model.addAttribute("alert", "success");
		} catch (Exception e) {
			model.addAttribute("message", "depart_delete_message_fail");
			model.addAttribute("alert", "danger");
		}
		
		return "redirect:/admin/depart/ListDepart.htm";
	}
	
	private void check(Depart depart, BindingResult bindingResult) {
		try {
			if(depart.getId().trim().length()==0) {
				bindingResult.rejectValue("id", "depart.validation.notempty.id");
			}
			else {
				List<Depart> temp = DepartService.getAll();
				
				for(Depart tempD : temp) {
					if(tempD.getId().equals(depart.getId())) {
						bindingResult.rejectValue("id", "depart.validation.exist.id");
						break;
						}
					}
				}
			if(depart.getName().trim().length()==0) {
				bindingResult.rejectValue("name", "depart.validation.notempty.name");
			}
		} catch (Exception e) {
		}
	}
	
	private void checkEdit(Depart depart, BindingResult bindingResult) {
		try {
			if(depart.getName().trim().length()==0) {
				bindingResult.rejectValue("name", "depart.validation.notempty.name");
			}
			
		} catch (Exception e) {
		}
	}
}