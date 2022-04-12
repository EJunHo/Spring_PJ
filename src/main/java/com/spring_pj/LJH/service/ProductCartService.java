package com.spring_pj.LJH.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface ProductCartService {
	//상품 카트 리스트
	public void cart_ListAction(HttpServletRequest req, Model model);
	//카트에 상품 추가 처리
	public void cart_ListAdd(HttpServletRequest req, Model model);
	//카트 상품 삭제 처리
	public void cart_ListDelete(HttpServletRequest req, HttpServletResponse res ,Model model);
	//카트 상품 전체 삭제
	public void cart_ListAll_Delete(HttpServletRequest req, HttpServletResponse res, Model model);

}
