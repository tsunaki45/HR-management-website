package poly.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			HttpSession tpsession = request.getSession();
			
			if (tpsession.getAttribute("USER") == null) {
				response.sendRedirect(request.getContextPath() + "/login/login.htm?message=Please sign in!");
				return false;
			}
		return true;
	}
}
