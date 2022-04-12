package com.spring_pj.LJH.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class UserDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		System.out.println("UserDeniedHandler : handle 진입");
		System.out.println("Session ID  : " + request.getSession().getAttribute("customerID"));
		//setAttribute에 문장 삽입도 가능
		request.setAttribute("errMsg", "관리자만 접근할 수 있는 페이지 입니다.");
		//해당 부분은 무조건적으로 everything 유저들이 지나가야 하므로 common이나 resoureces에 지정
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/accessDenied.jsp");
		
		dispatcher.forward(request, response);
		
	}

}
