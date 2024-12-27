package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dto.Post;


@WebServlet("/post")
public class PostServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/post.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String title = request.getParameter("title");
			String source = request.getParameter("source");

			String error = validate(title);
			if (error != null) {
				request.setAttribute("title", title);
				request.setAttribute("source", source);
				request.setAttribute("error", error);
				request.getRequestDispatcher("/WEB-INF/view/post.jsp")
						.forward(request, response);
				return;
			}

			Post post = Post.builder()
					.title(title)
					.source(source)
					.build();
			try {
				DaoFactory.createPostDao().create(post);
				request.getRequestDispatcher("/WEB-INF/view/submitted.jsp")
						.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	private String validate(String title) {
		String error = null;
		if(title.isBlank()) {
			error = "タイトルが未入力です";
		}
		return error;
	}
}
