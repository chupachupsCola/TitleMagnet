package dao;

import dto.Admin;

public interface AdminDao {
	Admin authenticateUser(String loginId, String loginPass) throws Exception;
}
