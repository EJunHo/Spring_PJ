package com.spring_pj.LJH.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;


public interface ConfrimOrderService {
	
	//구매 확정 처리
	public void confirm_Order_Action(HttpServletRequest req, Model model);
//	//구매 요청 리스트 - manager
	public void confirm_Order_List(HttpServletRequest req, Model model);
	//구매 승인 처리 - manager
	public void confirm_Action(HttpServletRequest req, HttpServletResponse res, Model model);
	//구매 거절 처리 - manager
	public void confirm_Cancle_Action(HttpServletRequest req, HttpServletResponse res, Model model);
	//구매 요청 리스트 - customer
	public void private_Order_item(HttpServletRequest req, Model model);
	//환불 요청 - customer
	public void refund_Action(HttpServletRequest req, HttpServletResponse res, Model model);
	//취소 요청 - customer
	public void cancle_Action(HttpServletRequest req, HttpServletResponse res, Model model);
	//결산 작업 - manager
	public void account_List(HttpServletRequest req, Model model);
	//환불 승인 - manager
	public void refund_Manager(HttpServletRequest req, Model model);
	
	
}
