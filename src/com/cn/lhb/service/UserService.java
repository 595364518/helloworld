package com.cn.lhb.service;

import com.cn.lhb.dao_impl.UserDaoImpl;
import com.cn.lhb.domain.Emails;
import com.cn.lhb.domain.User;

import java.sql.SQLException;

public class UserService {
    public static Emails checkEmails(String email) throws SQLException {

    	return new UserDaoImpl().checkEmails(email);

    }

    public int regist(User user) throws Exception {

	        return new UserDaoImpl().regist(user);
	    }

	public static User checkUsers(String username) throws SQLException {
		// TODO Auto-generated method stub
		return new UserDaoImpl().checkUsers(username);
	}

	public int insertCode(String username, int checkCode) throws Exception {
		// TODO Auto-generated method stub
		return new UserDaoImpl().insertCode(username,checkCode);
		
	}

	public int cmpCode(int check, String username) throws Exception {
		// TODO Auto-generated method stub
		return new UserDaoImpl().cmpCode(check,username);
	}
}
