package poly.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.entity.Record;
import poly.entity.Staff;
import poly.service.IRecordService;
import poly.service.IStaffService;
import poly.service.impl.StaffService;

@Controller
@RequestMapping("/admin/record/")
public class RecordController{
	
	@Autowired
	IRecordService recordService;
	
	@Autowired
	IStaffService staffService;
	
	@RequestMapping(value = "ListRecord")
	public String list(Model model, HttpServletRequest req) {
		try {
			
			String message = req.getParameter("message");
			String alert = req.getParameter("alert");
			
			req.setAttribute("records",recordService.findAll() );
			
			if(message != null) {
				req.setAttribute("message", message.replaceAll("_", "."));
				req.setAttribute("alert", alert);
			}
			
		} catch (Exception e) {
		}
		return "admin/record/ListRecord";
	}
	
	@RequestMapping(value = "DepartReport")
	public String departRecord(HttpServletRequest req) {
		
		req.setAttribute("DRList", recordService.findAllDepartReport());
		
		return "admin/record/DepartReport";
	}
	
	@RequestMapping(value = "StaffReport")
	public String staffRecord(HttpServletRequest req) {
		
		req.setAttribute("SRList", recordService.findAllStaffReport());
		
		return "admin/record/StaffReport";
	}
	
	@RequestMapping(value = "AddRecord")
	public String add(Model model, @ModelAttribute("records") Record record) {
		
		model.addAttribute("staffs", staffService.findAll());
		model.addAttribute("records", new Record());
		return "admin/record/AddRecord";
	}
	
	@RequestMapping(value = "EditRecord")
	public String edit(Model model, @ModelAttribute("id") Long id) {
		
		model.addAttribute("staffs", staffService.findAll());
		model.addAttribute("records", recordService.findRecord(id));
		return "admin/record/EditRecord";
	}
	
	@RequestMapping(value = "save")
	public String save(Model model, @ModelAttribute("record") Record record, BindingResult bindingResult) {
		try {
			if(record.getStaff().getId().length()==0) {
				bindingResult.rejectValue("staff", "record_validation_notempty_staff");
			}
		} catch (Exception e) {
		}
		
		if(bindingResult.hasErrors()) {
			return "admin/record/AddRecord";
		}
		else {
			try {
				recordService.addRecored(record);
				model.addAttribute("message", "record_edit_message_success");
				model.addAttribute("alert", "success");
				
			} catch (Exception e) {
				model.addAttribute("message", "record_edit_message_fail");
				model.addAttribute("alert", "danger");
			}
			return "redirect:/admin/record/ListRecord.htm";
		}
	}
	
	@RequestMapping(value = "update")
	public String update(Model model, @ModelAttribute("records") Record record) {
		
		try {
			recordService.updateRecord(record);
			model.addAttribute("message", "record_edit_message_success");
			model.addAttribute("alert", "success");
			return "redirect:/admin/record/ListRecord.htm";
		} catch (Exception e) {
			model.addAttribute("message", "record_edit_message_fail");
			model.addAttribute("alert", "danger");
			return "admin/record/EditRecord";
		}
	}
	
	@RequestMapping(value = "DeleteRecord", method = RequestMethod.GET)
	public String delete(Model model, @ModelAttribute("id") Long id) {
		try {
			recordService.deleteRecord(id);
			model.addAttribute("message", "record_delete_message_success");
			model.addAttribute("alert", "success");
			return "redirect:/admin/record/ListRecord.htm";
		} catch (Exception e) {
			model.addAttribute("message", "record_delete_message_fail");
			model.addAttribute("alert", "danger");
			return "redirect:/admin/record/ListRecord.htm";
		}

	}
	
	
	
	
	
}
