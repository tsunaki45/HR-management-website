package poly.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.entity.Staff;
import poly.service.IDepartService;
import poly.service.IStaffService;

@Controller
@RequestMapping(value = "admin/staff/")
public class StaffController{
	
	@Autowired
	IStaffService StaffService;
	
	@Autowired
	IDepartService DepartService;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "ListStaff")
	public String list(ModelMap model, HttpServletRequest req) {
		
		try {
			String message = req.getParameter("message");
			String alert = req.getParameter("alert");
			
			req.setAttribute("staffs", StaffService.findAll());
			
			if (message != null) {
				req.setAttribute("message", message.replaceAll("_", "."));
				req.setAttribute("alert", alert);
			}
		} catch (Exception e) {
		}
		
		return "admin/staff/ListStaff";
	}
	
	@RequestMapping(value = "AddStaff")
	public String showAdd(Model model ,@ModelAttribute("staffs") Staff staff) {
		model.addAttribute("check", false);
		model.addAttribute("staffs", new Staff());
		model.addAttribute("departs", DepartService.getAll());
		return "admin/staff/AddStaff";
	}
	
	
	@RequestMapping(value = "EditStaff")
	public String showEdit(ModelMap model,@ModelAttribute("id") String id) {
		model.addAttribute("check", true);
		model.addAttribute("departs", DepartService.getAll());
		model.addAttribute("staffs", StaffService.findStaff(id));
		return "admin/staff/EditStaff";
	}
	
	@RequestMapping(value = "save")
	public String save(Model model, @ModelAttribute("staffs") Staff staff, BindingResult bindingResult) {
		check(staff, bindingResult);
		if(bindingResult.hasErrors()) {
			model.addAttribute("departs", DepartService.getAll());
			return "admin/staff/AddStaff";
		}
		else {
			try {
				
				StaffService.addStaff(staff);
				model.addAttribute("message", "staff.edit.message.success");
				model.addAttribute("alert", "success");
				return "redirect:/admin/staff/ListStaff.htm";
				
			} catch (Exception e) {
				model.addAttribute("message", "staff.edit.message.fail");
				model.addAttribute("alert", "danger");
				return "redirect:/admin/staff/AddStaff.htm";
			}
		}
		
		
	}
	
	@RequestMapping(value = "update")
	public String update(ModelMap model,@ModelAttribute("staffs") Staff staff, BindingResult bindingResult) {
		checkEdit(staff, bindingResult);
		if(bindingResult.hasErrors()) {
			model.addAttribute("departs", DepartService.getAll());
			return "admin/staff/EditStaff";
		}
		else {
			
			try {
				
				StaffService.updateStaff(staff);
				model.addAttribute("message", "staff.edit.message.success");
				model.addAttribute("alert", "success");
				return "redirect:/admin/staff/ListStaff.htm";
			} catch (Exception e) {
				model.addAttribute("message", "staff.edit.message.fail");
				model.addAttribute("alert", "danger");
			}
			
			return "redirect:/admin/staff/EditStaff.htm";
		}
	}
	
	@RequestMapping(value = "DeleteStaff", method = RequestMethod.GET)
	public String delete(ModelMap model, HttpServletRequest req) {
		try {
			String id = req.getParameter("id");
			StaffService.deleteStaff(id);
			model.addAttribute("message", "staff.delete.message.success");
			model.addAttribute("alert", "success");
		} catch (Exception e) {
			model.addAttribute("message", "staff.delete.message.fail");
			model.addAttribute("alert", "danger");
		}
		return "redirect:/admin/staff/ListStaff.htm";
	}
	
	
	private void check(Staff staff, BindingResult bindingResult) {
		try {
			if(staff.getId().trim().length()==0) {
				bindingResult.rejectValue("id", "staff.validation.notempty.id");
			}
			else {
				List<Staff> temp = StaffService.findAll();
				for(Staff tempS : temp) {
					if(tempS.getId().equals(staff.getId())) {
						bindingResult.rejectValue("id", "staff.validation.exist.id");
						break;
					}
				}
			}
			
			if(staff.getName().trim().length()==0) {
				bindingResult.rejectValue("name", "staff.validation.notempty.name");
			}
			
			if(staff.getGender() == null) {
				bindingResult.rejectValue("gender", "staff.validation.notempty.gender");
			}
			
			if(staff.getBirthday().trim().length() == 0) {
				bindingResult.rejectValue("birthday", "staff.validation.notempty.birthday");
			}
			else {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				try {
					format.parse(staff.getBirthday());
					
					String [] birthday = staff.getBirthday().split("-");
					
					if (Integer.parseInt(birthday[1]) > 12) {
						bindingResult.rejectValue("birthDay", "staff.validation.format.birthday");
					} else if (Integer.parseInt(birthday[2]) > 31) {
						bindingResult.rejectValue("birthDay", "staff.validation.format.birthday");
					}
				} catch (Exception e) {
					bindingResult.rejectValue("birthDay", "staff.validation.format.birthday");
				}
			}
			
			if (staff.getPhoto().trim().length() == 0) {
				bindingResult.rejectValue("photo", "staff.validation.notempty.photo");
			}

			if (staff.getEmail().trim().length() == 0) {
				bindingResult.rejectValue("email", "staff.validation.notempty.email");
			} else if (!staff.getEmail().matches("^\\w+[0-9a-z]*@\\w+(\\.\\w+){1,3}")) {
				bindingResult.rejectValue("email", "staff.validation.format.email");
			}

			if (staff.getPhone().trim().length() == 0) {
				bindingResult.rejectValue("phone", "staff.validation.notempty.phone");
			} else if (!staff.getPhone().matches("\\d*")) {
				bindingResult.rejectValue("phone", "staff.validation.format.phone");
			}

			if (staff.getDepart().getId().length() == 0) {
				bindingResult.rejectValue("depart", "staff.validation.notempty.depart");
			}

			if (staff.getSalary().toString().length() == 0) {
				bindingResult.rejectValue("salary", "staff.validation.notempty.salary");
			} else if (staff.getSalary() < 0.0) {
				bindingResult.rejectValue("salary", "staff.validation.format.salary");
			}
		} catch (Exception e) {
		}
	}
	
	private void checkEdit(Staff staff, BindingResult bindingResult) {
		try {
			if(staff.getId().trim().length()==0) {
				bindingResult.rejectValue("id", "staff.validation.notempty.id");
			}
			
			if(staff.getName().trim().length()==0) {
				bindingResult.rejectValue("name", "staff.validation.notempty.name");
			}
			
			if(staff.getGender() == null) {
				bindingResult.rejectValue("gender", "staff.validation.notempty.gender");
			}
			
			if(staff.getBirthday().trim().length() == 0) {
				bindingResult.rejectValue("birthday", "staff.validation.notempty.birthday");
			}
			else {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				try {
					format.parse(staff.getBirthday());
					
					String [] birthday = staff.getBirthday().split("-");
					
					if (Integer.parseInt(birthday[1]) > 12) {
						bindingResult.rejectValue("birthDay", "staff.validation.format.birthday");
					} else if (Integer.parseInt(birthday[2]) > 31) {
						bindingResult.rejectValue("birthDay", "staff.validation.format.birthday");
					}
				} catch (Exception e) {
					bindingResult.rejectValue("birthDay", "staff.validation.format.birthday");
				}
			}
			
			if (staff.getPhoto().trim().length() == 0) {
				bindingResult.rejectValue("photo", "staff.validation.notempty.photo");
			}

			if (staff.getEmail().trim().length() == 0) {
				bindingResult.rejectValue("email", "staff.validation.notempty.email");
			} else if (!staff.getEmail().matches("^\\w+[0-9a-z]*@\\w+(\\.\\w+){1,3}")) {
				bindingResult.rejectValue("email", "staff.validation.format.email");
			}

			if (staff.getPhone().trim().length() == 0) {
				bindingResult.rejectValue("phone", "staff.validation.notempty.phone");
			} else if (!staff.getPhone().matches("\\d*")) {
				bindingResult.rejectValue("phone", "staff.validation.format.phone");
			}

			if (staff.getDepart().getId().length() == 0) {
				bindingResult.rejectValue("depart", "staff.validation.notempty.depart");
			}

			if (staff.getSalary() == null) {
				bindingResult.rejectValue("salary", "staff.validation.notempty.salary");
			} else if (staff.getSalary() < 0.0) {
				bindingResult.rejectValue("salary", "staff.validation.format.salary");
			}
		} catch (Exception e) {
		}
	}
	
}
