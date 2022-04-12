package com.spring_pj.LJH.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_pj.LJH.service.ConfrimOrderService;

@Controller
public class ConfrimOrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(ConfrimOrderController.class);
	
	@Autowired
	ConfrimOrderService service;
	
	String viewPage = "";
	
	/* 
	 * Customer - 고객 장바구니 상품 구매 요청
	*/
	@RequestMapping("cart_Order.co")
	public String cart_Order(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [cart_Order] ");
		
		service.confirm_Order_Action(req, model);
		
		return "common/main";
	}
	/* 
	 * Manager - 고객 상품 구매 요청 리스트
	*/
	@RequestMapping("order_Check.co")
	public String order_Check(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [order_Check] ");
		
		service.confirm_Order_List(req, model);
		
		return "manager/stock_order/order_Chk";
	}
	/* 
	 * 특정 고객 주문조회 리스트
	*/
	@RequestMapping("delivery_Order.co")
	public String delivery_Order(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [delivery_Order] ");
		
		service.private_Order_item(req, model);
		
		return "customer/customer_Page/order/delivery_Order";
	}
	/* 
	 * manager - 구매 요청 승인
	*/
	@RequestMapping("confirm.co")
	public void confirm(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[URL Controller] - > [confirm] ");
		
		service.confirm_Action(req, res, model);
		
		viewPage = req.getContextPath() + "/order_Check.co";
		res.sendRedirect(viewPage);
	}
	/* 
	 * manager - 구매 요청 거절
	*/
	@RequestMapping("cancle.co")
	public void cancle(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[URL Controller] - > [confirm_cancle] ");
		
		service.confirm_Cancle_Action(req, res, model);
		
		viewPage = req.getContextPath() + "/order_Check.co";
		
		res.sendRedirect(viewPage);
	}
	/* 
	 * customer - 상품 환불
	*/
	@RequestMapping("refund.co")
	public void refund(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[URL Controller] - > [refund] ");
		
		service.refund_Action(req, res, model);
		
		viewPage = req.getContextPath() + "/delivery_Order.co";
		res.sendRedirect(viewPage);
	}
	/* 
	 * customer - 구매 취소
	*/
	@RequestMapping("order_cancle.co")
	public void order_cancle(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[URL Controller] - > [order_cancle] ");
		
		service.cancle_Action(req, res, model);
		
		viewPage = req.getContextPath() + "/delivery_Order.co";
		res.sendRedirect(viewPage);
	}
	/* 
	 * Manager - 환불 리스트
	*/
	@RequestMapping("refund_manager.co")
	public String refund_manager(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [refund_manager] ");
		
		service.refund_Manager(req, model);
		
		return "manager/stock_order/orderfundCancel";
	}
	/* 
	 * Manager - 환불 승인
	*/
	@RequestMapping("refund_confirm.co")
	public void refund_confirm(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		logger.info("[URL Controller] - > [refund_manager] ");
		
		service.cancle_Action(req, res, model);
		
		viewPage = req.getContextPath() + "/orderfundCancel.co";
		res.sendRedirect(viewPage);
	}
	/* 
	 * Manager - 환불 승인
	*/
	@RequestMapping("account.co")
	public String account(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [account] ");
		
		service.account_List(req, model);
		
		return "manager/account/account";
	}
	
}
