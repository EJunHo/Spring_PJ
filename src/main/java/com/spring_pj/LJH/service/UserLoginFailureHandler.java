package com.spring_pj.LJH.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	//로그인이 실패할 경우 자동으로 실행하는 코드
	public UserLoginFailureHandler(SqlSessionTemplate sqlSession, BCryptPasswordEncoder passwordEncoder) {
		this.sqlSession = sqlSession;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		System.out.println("UserLoginFailureHandler - onAuthenticationFailure으로 진입");
		
		String strId = request.getParameter("id");
		String strPwd = request.getParameter("password");
		
		int cnt = sqlSession.selectOne("com.spring_pj.LJH.dao.MemberDAO.idCheck", strId);
		
		if(cnt != 0) {
			//암호화 된 비밀번호를 db에서 가져옴
			String encyptPassword = sqlSession.selectOne("com.spring_pj.LJH.dao.MemberDAO.pwdCheck", strId);
			System.out.println("암호화 된 비밀번호 : " + encyptPassword);
			System.out.println("화면에서 입력받은 비밀번호 : " + strPwd);
			//입력된 비밀번호와 가입된 비밀번호(암호화된 비밀번호)가 일치하는지를 판단
			if(passwordEncoder.matches(strPwd, encyptPassword)) {
				//암호 일치
				System.out.println("이메일 인증");
				request.setAttribute("errorMsg", "이메일 인증하세요.!!");
				
			} else {
				//암호 불일치
				System.out.println("<<비밀번호가 일치하지 않습니다.>>");
			}
				
		} else {
			//입력된 아이디 불일치
			System.out.println("아이디 불일치");
			request.setAttribute("errorMsg", "아이디가 일치하지 않습니다. ");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customer/customer_Login/login.jsp");
		dispatcher.forward(request, response);
	}

}
