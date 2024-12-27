package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoFactory;
import dao.PostDao;
import dto.Post;


@WebServlet("/admin/managePosts")
public class ManagePostsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PostDao postDao = DaoFactory.createPostDao();
			List<Post> unapprovedPosts = postDao.readAllUnapproved();
			List<Post> approvedPosts = postDao.readAllApproved();
			
			List<Integer> idList = getUnapprovedPostIdsWithDuplicateTitles(unapprovedPosts, approvedPosts);
			
 			request.setAttribute("posts", unapprovedPosts);
 			request.setAttribute("idList", idList);
 			
			request.getRequestDispatcher("/WEB-INF/view/managePosts.jsp")
			.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private List<Integer> getUnapprovedPostIdsWithDuplicateTitles(List<Post> unapprovedPosts, List<Post> approvedPosts) {
		List<Integer> idList = new ArrayList<>();
		for(Post unapprovedPost: unapprovedPosts) {
			for(Post approvedPost : approvedPosts) {
				if(approvedPost.getTitle().equals(unapprovedPost.getTitle())) {
					idList.add(unapprovedPost.getId());
				}
			}
		}	
		return idList;
	}
}
