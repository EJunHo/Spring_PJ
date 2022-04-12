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

import com.spring_pj.LJH.dao.ProductCartDAO;
import com.spring_pj.LJH.service.ProductCartService;


@Controller
public class ProductCartController {

	private static final Logger logger = LoggerFactory.getLogger(ProductCartController.class);

	@Autowired
	ProductCartDAO dao;
	
	@Autowired
	ProductCartService service;
	
	String viewPage = "";
	
	@RequestMapping("cart_Order_List.ct")
	public String cart_Order_List(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [cart_Order_List]");
		
		service.cart_ListAction(req, model);
		
		return "customer/customer_Page/cart/cart_Order_List";
	}
	
	@RequestMapping("cartAddAction.ct")
	public String cartAddAction(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [cartAddAction]");
		
		service.cart_ListAdd(req, model);
		
		return "customer/customer_Page/cart/cartAddAction";
	}
	
	@RequestMapping("buynow.ct")
	public String buynow (HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [buynow]");
		
		service.cart_ListAdd(req, model);
		service.cart_ListAction(req, model);
		
		return "customer/customer_Page/cart/cart_Order_List";
	}
	
	@RequestMapping("cartDeleteAction.ct")
	public void cartDeleteAction(HttpServletRequest req, 
			HttpServletResponse res ,Model model) throws IOException {
		
		service.cart_ListDelete(req, res, model);
		
		viewPage = req.getContextPath() + "/cart_Order_List.ct";
		
		res.sendRedirect(viewPage);
	}
	
	@RequestMapping("cartDeleteAction_All.ct")
	public void cartDeleteAction_All (HttpServletRequest req, 
			HttpServletResponse res, Model model) throws IOException {
		
		service.cart_ListAll_Delete(req, res, model);
		
		viewPage = req.getContextPath() + "/cart_Order_List.ct";
		res.sendRedirect(viewPage);
	}
}
