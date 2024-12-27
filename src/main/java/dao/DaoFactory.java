package dao;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DaoFactory {
	public static AdminDao createAdminDao() {
		return new AdminDaoImpl(getDataSource());
	}
	
	public static PostDao createPostDao() {
		return new PostDaoImpl(getDataSource());
	}
	 
	public static DataSource getDataSource() {
		InitialContext ctx = null;
		DataSource ds = null;
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mgt_db");
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
			try {
				ctx.close();
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		
		return ds;
	}
}
