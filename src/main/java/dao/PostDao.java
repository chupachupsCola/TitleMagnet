package dao;

import java.util.List;

import dto.Post;

public interface PostDao {
	void create(Post post) throws Exception;
	List<Post> readAllApproved() throws Exception;
	List<Post> readAllUnapproved() throws Exception;
	Post readUnapprovedById(Integer id) throws Exception;
	void update(Post post) throws Exception;
	void delete(Post post) throws Exception;
}
