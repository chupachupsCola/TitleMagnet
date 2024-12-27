package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import dto.Post;

public class PostDaoImpl implements PostDao{
	private DataSource ds = null;
	
	public PostDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public void create(Post post) throws Exception {
		try(Connection con = ds.getConnection()){
			String sql = "INSERT INTO posts (title, source) VALUES (?, ?)";
			var stmt = con.prepareStatement(sql);
			stmt.setString(1, post.getTitle());
			stmt.setString(2, post.getSource());
			
			stmt.executeUpdate();
		}
	}

	@Override
	public List<Post> readAllApproved() throws Exception {
		List<Post> approvedPosts = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM posts WHERE author IS NOT NULL";
			var stmt = con.prepareStatement(sql);
			
			var rs = stmt.executeQuery();
			while(rs.next()) {
				approvedPosts.add(mapToPost(rs));
			}
		}
		return approvedPosts;
	}


	@Override
	public List<Post> readAllUnapproved() throws Exception {
		List<Post> unapprovedPosts = new ArrayList<>();
		try (Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM posts WHERE author IS NULL";
			var stmt = con.prepareStatement(sql);

			var rs = stmt.executeQuery();
			while (rs.next()) {
				unapprovedPosts.add(mapToPost(rs));
			}
		}
		return unapprovedPosts;
	}

	@Override
	public Post readUnapprovedById(Integer id) throws Exception {
		Post post = null;
		try(Connection con  = ds.getConnection()){
			String sql = "SELECT * FROM posts WHERE id=?";
			var stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			
			var rs = stmt.executeQuery();
			if(rs.next()) {
				post = mapToPost(rs);
			}
		}
		return post;
	}
	
	@Override
	public void update(Post post) throws Exception {
		try (Connection con = ds.getConnection()) {
			String sql = "UPDATE posts "
					   + "SET title=?, source=?, author=?, publisher_name=?, url=? "
					   + "where id=?";
			var stmt = con.prepareStatement(sql);
			stmt.setString(1, post.getTitle());
			stmt.setString(2, post.getSource());
			stmt.setString(3, post.getAuthor());
			stmt.setString(4, post.getPublisherName());
			stmt.setString(5, post.getUrl());
			stmt.setInt(6,post.getId());
			
			stmt.executeUpdate();
		}
	}

	@Override
	public void delete(Post post) throws Exception {
		try (Connection con = ds.getConnection()) {
			String sql = "DELETE FROM posts WHERE id=?";
			var stmt = con.prepareStatement(sql);
			stmt.setInt(1, post.getId());
			
			stmt.executeUpdate();
		}
	}

	private Post mapToPost(ResultSet rs) throws SQLException {
		return Post.builder()
				   .id(rs.getInt("id"))
				   .title(rs.getString("title"))
				   .source(rs.getString("source"))
				   .author(rs.getString("author"))
				   .publisherName(rs.getString("publisher_name"))
				   .url(rs.getString("url"))
				   .build();
	}

}
