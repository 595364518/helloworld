package com.cn.lhb.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cn.lhb.service.UserService;
import com.cn.lhb.utils.CodeUtils;
import com.cn.lhb.utils.MailUtils;

/**
 * Servlet implementation class CheckCodeServlet
 */
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		System.out.println("邮箱地址:"+email);
		Random rand = new Random();
		int checkCode = CodeUtils.getCode();
		String content=null;
		content+="<div style='background:#f7f7f7;overflow:hidden'>";
		content+="<div style='background:#fff;border:1px solid #ccc;margin:2%;padding:0 30px'>";
		content+="<div style='line-height:40px;height:40px'>&nbsp;</div>";
		content+="<p style='margin:0;padding:0;font-size:14px;line-height:30px;color:#333;font-family:arial,sans-serif;font-weight:bold'>亲爱的用户 <b style='font-size:18px;color:#f90'></b>：</p>"+username;
		content+="<div style='line-height:20px;height:20px'>&nbsp;</div>";
		content+="<p style='margin:0;padding:0;line-height:30px;font-size:14px;color:#333;font-family:'宋体',arial,sans-serif'>您好！感谢您使用该服务，您正在进行邮箱验证，本次请求的验证码为：</p>";
		content+="<p style='margin:0;padding:0;line-height:30px;font-size:14px;color:#333;font-family:'宋体',arial,sans-serif'>";
		content+="<b style='font-size:18px;color:#f90'>"+checkCode+"</b>";
		content+="<span style='margin:0;padding:0;margin-left:10px;line-height:30px;font-size:14px;color:#979797;font-family:'宋体',arial,sans-serif'>(为了保障您账号的安全性，请在1小时内完成验证。)</span>";
		content+="</p>";
		content+="<div style='line-height:80px;height:80px'>&nbsp;</div>";
		content+="</div>";
		content+="</div>";
		MailUtils.sendMail(email, content,"邮箱验证");
		try {
			int state = new UserService().insertCode(username,checkCode);
			//request.getRequestDispatcher("/jsp/checkCode.jsp").forward(request, response);
			response.getWriter().println(state);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}
