package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/admin/*")
public class AuthFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		var req = (HttpServletRequest)request;
		var resp = (HttpServletResponse)response;
		var session = req.getSession();
		String requestURI = req.getRequestURI();
		if(!requestURI.endsWith("/login") &&
		   !requestURI.endsWith("/logout")) {
			if(session.getAttribute("loginId") == null) {
				resp.sendRedirect(req.getContextPath() + "/admin/login");
				return;
			}
		}
		chain.doFilter(request, response);
	}

}
