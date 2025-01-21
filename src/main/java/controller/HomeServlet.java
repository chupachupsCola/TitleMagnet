package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dto.Post;


@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Post> approvedPosts = DaoFactory.createPostDao().readAllApproved();;
			Collections.shuffle(approvedPosts);
			request.setAttribute("approvedPosts", approvedPosts);
			request.getRequestDispatcher("/WEB-INF/view/home.jsp")
					.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
