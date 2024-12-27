package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dto.Post;


@WebServlet("/admin/editPost")
public class EditPostServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			Post post = DaoFactory.createPostDao().readUnapprovedById(id);
			request.setAttribute("post", post);
			request.getRequestDispatcher("/WEB-INF/view/editPost.jsp")
			.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> inputs = collectParams(request, "id", "title", "source", "author", "publisherName",
				"url");
		try {
			Map<String, String> errors = validate(inputs);
			if (errors.size() > 0) {
				request.setAttribute("inputs", inputs);
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("/WEB-INF/view/editPost.jsp")
						.forward(request, response);
				return;
			}

			Post post = Post.builder()
					.id(Integer.parseInt(inputs.get("id")))
					.title(inputs.get("title"))
					.source(inputs.get("source"))
					.author(inputs.get("author"))
					.publisherName(inputs.get("publisherName"))
					.url(inputs.get("url"))
					.build();
			DaoFactory.createPostDao().update(post);
			request.getRequestDispatcher("/WEB-INF/view/editPostSuccess.jsp")
					.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private Map<String, String> collectParams(HttpServletRequest request, String... paramNames) {
		Map<String, String> inputs = new HashMap<>();
		for(String key : paramNames) {
			inputs.put(key, request.getParameter(key));
		}
		return inputs;
	}

	private Map<String, String> validate(Map<String, String> inputs) throws Exception {
		Map<String, String> errors = new HashMap<>();
		
		String[] fieldNames = {"title", "author", "publisherName", "url"};
		String[] fieldLabels = {"タイトル", "著者名", "出典作品名", "URL"}; 
		for(int i = 0; i < fieldNames.length; i++) {
			if(inputs.get(fieldNames[i]).isBlank()) {
				errors.put(fieldNames[i],fieldLabels[i] + "が未入力");
			}
		}
		
		List<Post> approvedPosts = DaoFactory.createPostDao().readAllApproved();
		for(Post post : approvedPosts) {
			if(inputs.get("title").equals(post.getTitle())) {
				errors.put("title", "既に登録されています");
				break;
			}
		}
		
		return errors;
	}
}
