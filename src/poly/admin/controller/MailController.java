package poly.admin.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("admin")
public class MailController {
	
	@RequestMapping("email")
	public String mail(HttpServletRequest req) {
		try {
			
			String message = req.getParameter("message");
			String alert = req.getParameter("alert");
			
			if(message != null) {
				req.setAttribute("message", message.replaceAll("_", "."));
				req.setAttribute("alert", alert);
			}
			
		} catch (Exception e) {
		}
		return "admin/email";
		
	}
	
	@Autowired
	JavaMailSender mailer;
	
	@RequestMapping("send")
	public String send(ModelMap model,
			@RequestParam("from") String from,
			@RequestParam("to") String to,
			@RequestParam("subject") String subject,
			@RequestParam("body") String body) {
		
		try {
			MimeMessage mail = mailer.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(mail);
			helper.setFrom(from, from);
			helper.setTo(to);
			helper.setReplyTo(from, from);
			helper.setSubject(subject);
			helper.setText(body, true);
			
			mailer.send(mail);
			
			model.addAttribute("message", "global.mail.message.success");
			model.addAttribute("alert", "success");
			return "redirect:/admin/email.htm";
			
		} catch (Exception e) {
			model.addAttribute("message", "global.mail.message.fail");
			model.addAttribute("alert", "danger");
			return "admin/email";
		}
		
		
	}
}
