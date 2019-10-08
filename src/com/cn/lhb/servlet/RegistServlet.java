package com.cn.lhb.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cn.lhb.domain.User;
import com.cn.lhb.service.UserService;

/**
 * Servlet implementation class RegistServlet
 */
public class RegistServlet extends HttpServlet {
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
		request.setCharacterEncoding("utf-8");
        User user = new User();
        try{
            user.setUsername(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));
            user.setAge(Integer.parseInt(request.getParameter("age")));
            user.setEmail(request.getParameter("email"));
            user.setSex(request.getParameter("sex"));
            String checkCode = request.getParameter("checkCode");
            int i = new UserService().regist(user);
            if (i == 1){
                System.out.println("success");
                request.getRequestDispatcher("/jsp/success.jsp").forward(request,response);
            }else{
                request.getRequestDispatcher("/jsp/failed.jsp").forward(request,response);
                System.out.println("failed");
            }

        }catch (Exception e){
            e.printStackTrace();
        }
	}

}
