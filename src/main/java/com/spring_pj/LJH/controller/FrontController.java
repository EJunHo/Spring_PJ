package com.spring_pj.LJH.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/front")
public class FrontController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public FrontController() {
		System.out.println("[FronController 입장]");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		super.doGet(req, res);
		
		System.out.println("Front_Controller");
		//1. 라우터 만들기
		String path = req.getParameter("path");
		System.out.println("path : "  + path);
		
		if(path.equals("login")) {
			
			res.sendRedirect("/login.jsp");
		
		} else if(path.equals("join")) {
			
			res.sendRedirect("/join.jsp");
		}
		
	}
	
	
}
