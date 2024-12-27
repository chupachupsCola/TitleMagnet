package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoFactory;
import dto.Admin;


@WebServlet("/admin/login")
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/login.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = request.getParameter("loginId");
		String loginPass = request.getParameter("loginPass");
		
		Map<String, String> errors = validate(loginId, loginPass);
		if(errors.size() > 0) {
			request.setAttribute("loginId", loginId);
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("/WEB-INF/view/login.jsp")
					.forward(request, response);
			return;
		}
		
		try {
			Admin admin = DaoFactory.createAdminDao()
									.authenticateUser(loginId, loginPass);
			if(admin == null) {
				request.setAttribute("loginId", loginId);
				request.setAttribute("error", "ログインIDかパスワードが不正です");
				request.getRequestDispatcher("/WEB-INF/view/login.jsp")
						.forward(request, response);
				return;
			}
			// パスワード:nayuta0108
			
			HttpSession session = request.getSession();
			session.setAttribute("loginId", loginId);
			response.sendRedirect(request.getContextPath() + "/admin/managePosts");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Map<String, String> validate(String loginId, String loginPass) {
		Map<String, String> errors = new HashMap<>();
		if(loginId.isBlank()) {
			errors.put("loginId", "ログインIDが未入力です");
		}
		
		if(loginPass.isBlank()) {
			errors.put("loginPass", "パスワードが未入力です");
		}
		
		return errors;
	}

}
