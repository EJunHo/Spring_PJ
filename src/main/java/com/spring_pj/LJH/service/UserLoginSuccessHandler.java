package com.spring_pj.LJH.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.spring_pj.LJH.dto.UserVO;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 기본 생성자 
	//security-context.xml에서 매개변수 생성자 sqlSession을 생성 후 그 주소값을 매개변수로 전달받음.
	public UserLoginSuccessHandler(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		System.out.println("onAuthenticationSuccess -- onAuthenticationSuccess 진입 ");
		
		UserVO vo = (UserVO)authentication.getPrincipal();
		System.out.println("UserVO : " + vo.getUsername());
		
		String msg =  authentication.getName() + " 님 환영합니다. ";
		
		String authority = sqlSession.selectOne("com.spring_pj.LJH.dao.MemberDAO.authorityChk", authentication.getName());
		
		request.setAttribute("msg", msg);
		request.getSession().setAttribute("customerID", authentication.getName());
		request.getSession().setAttribute("authority", authority);
		
		int grade = 0;
		if(authority.equals("ROLE_USER")) {
			grade = 1;
			RequestDispatcher dispatcher = request.getRequestDispatcher("/main.do");
			dispatcher.forward(request, response);
		} else {
			grade = 0;
			RequestDispatcher dispatcher = request.getRequestDispatcher("/productList.st");
			dispatcher.forward(request, response);
		}
		
	}

}
