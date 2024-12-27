package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dto.Post;


@WebServlet("/admin/deletePost")
public class DeletePostServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			Post post = DaoFactory.createPostDao().readUnapprovedById(id);
			request.setAttribute("post", post);
			request.getRequestDispatcher("/WEB-INF/view/deletePost.jsp")
					.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String strId = request.getParameter("id");
			Post post = Post.builder().id(Integer.parseInt(strId)).build();
			DaoFactory.createPostDao().delete(post);
			request.getRequestDispatcher("/WEB-INF/view/deletePostSuccess.jsp")
					.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
