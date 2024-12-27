package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import dto.Admin;

public class AdminDaoImpl implements AdminDao{
	private DataSource ds;
	
	public AdminDaoImpl(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public Admin authenticateUser(String loginId, String loginPass) throws Exception {
		Admin admin = findUserByloginId(loginId);
		
		
		if(admin == null) {
			System.out.println("ログインIDが不正");
		}else if(!BCrypt.checkpw(loginPass, admin.getLoginPass())){
			System.out.println("パスワードが不正");
			admin = null;
		}
		return admin;
	}

	private Admin findUserByloginId(String loginId) throws SQLException {
		Admin admin = null;
		try(Connection con = ds.getConnection()) {
			String sql = "SELECT * FROM admins WHERE login_id = ?";
			var stmt = con.prepareStatement(sql);
			stmt.setString(1, loginId);
			
			var rs = stmt.executeQuery();
			if(rs.next()) {
				admin = mapToAdmin(rs);
			}
		}
		return admin;
	}

	private Admin mapToAdmin(ResultSet rs) throws SQLException {
		return Admin.builder()
					.id(rs.getInt("id"))
					.loginId(rs.getString("login_id"))
					.loginPass(rs.getString("login_pass"))
					.name(rs.getString("name"))
					.build();
	}

}
