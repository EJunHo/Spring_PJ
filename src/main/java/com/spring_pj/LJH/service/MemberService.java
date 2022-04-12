package com.spring_pj.LJH.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberService {
	//기능 정의서 
	
	//중복 확인
	public void confirmAction(HttpServletRequest req, Model model);
	//회원 가입
	public void signInAction(HttpServletRequest req, Model model);
	//회원 로그인
	public void loginAction(HttpServletRequest req, Model model);
	//회원 인증 및 탈퇴
	public void deleteMemberAction(HttpServletRequest req, Model model);
	//회원 상세페이지
	public void modifyDeteailAction(HttpServletRequest req, Model model);
	//회원 정보 수정
	public void modifyMemberAction(HttpServletRequest req, Model model);
	// 이메일 인증
	public void emailCheckAction(HttpServletRequest req, Model model);
	
}
