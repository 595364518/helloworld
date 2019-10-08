package com.cn.lhb.domain;

import java.io.Serializable;

public class Code implements Serializable {
	private int cid;
	private String usernames;
	private int check_code;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getUsernames() {
		return usernames;
	}
	public void setUsernames(String usernames) {
		this.usernames = usernames;
	}
	public int getCheck_code() {
		return check_code;
	}
	public void setCheck_code(int check_code) {
		this.check_code = check_code;
	}
	
	
}
