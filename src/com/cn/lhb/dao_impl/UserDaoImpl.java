package com.cn.lhb.dao_impl;

import com.cn.lhb.dao.IUserDao;
import com.cn.lhb.domain.Code;
import com.cn.lhb.domain.Emails;
import com.cn.lhb.domain.User;
import com.cn.lhb.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDaoImpl implements IUserDao {
	 @Override
	    public int regist(User user) throws SQLException {
	        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	        String sql = "insert into user values(null,?,?,?,?,?)";
	        return qr.update(sql,user.getUsername(),user.getPassword(),user.getSex(),user.getAge(),user.getEmail());
	    }

	public User checkUsers(String username) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where username=?";
		return qr.query(sql,new BeanHandler<>(User.class),username);
	}

	public int insertCode(String username, int checkCode) throws Exception {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into code values(null,?,?)";
		return qr.update(sql,username,checkCode);
	}

	public int cmpCode(int check,String username) throws Exception {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from code where usernames = ?";
		String sql2 = "delete from code where usernames=?";
		Code code = null;
		code = qr.query(sql, new BeanHandler<>(Code.class),username);
		//System.out.println("check_code:"+emails.getCheck_code()+"usernames:"+emails.getUsernames()+"check:"+check);
		if(code.getCheck_code() == check) {
			qr.update(sql2,username);
			return 1;			
		}
		return 0;
	}

	@Override
	public Emails checkEmails(String email) throws SQLException {
	 	QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	 	String sql = "select * from user where email = ?";
		return qr.query(sql,new BeanHandler<>(Emails.class),email);
	}
}
