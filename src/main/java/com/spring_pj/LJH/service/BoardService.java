package com.spring_pj.LJH.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface BoardService {
	//게시글 목록 페이지
	public void board_List(HttpServletRequest req, Model model)throws ServletException, IOException;
	//게시글 상세 페이지
	public void board_Detail(HttpServletRequest req, Model model)throws ServletException, IOException;
	//게시글 입력 페이지
	public void board_Insert(HttpServletRequest req,Model model)throws ServletException, IOException;
	//게시글 수정 페이지
	public void board_Update(HttpServletRequest req, HttpServletResponse res, Model model)throws ServletException, IOException;
	//게시글 삭제 페이지
	public void board_Delete(HttpServletRequest req, HttpServletResponse res, Model model)throws ServletException, IOException;
	//게시글 삭제시 암호 확인
	public String board_PasswordCheck(HttpServletRequest req,HttpServletResponse res ,Model model) throws ServletException, IOException;
	//댓글 추가 페이지
	public void comment_Add(HttpServletRequest req, Model model)throws ServletException, IOException;
	//댓글 목록 페이지
	public void comment_List(HttpServletRequest req, Model model)throws ServletException, IOException;
}
