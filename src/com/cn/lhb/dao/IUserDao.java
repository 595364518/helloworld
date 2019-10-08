package com.cn.lhb.dao;

import java.sql.SQLException;
import java.util.List;

import com.cn.lhb.domain.Emails;
import com.cn.lhb.domain.User;

public interface IUserDao {
	
	int regist(User user) throws SQLException;
	User checkUsers(String username) throws SQLException;
	int insertCode(String username,int checkCode) throws Exception;
	int cmpCode(int check,String username) throws Exception;

    Emails checkEmails(String email) throws SQLException;
}
