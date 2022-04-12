package com.spring_pj.LJH.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring_pj.LJH.dao.ProductCartDAO;
import com.spring_pj.LJH.dto.ProductCartDTO;


@Service
public class ProductCartServiceImpl implements ProductCartService{
	
	@Autowired
	ProductCartDAO dao;
	
	//상품 카트 리스트
	@Override
	public void cart_ListAction(HttpServletRequest req, Model model) {
		System.out.println("[Service] -> cart_ListAction");
		
		String order_id = (String)req.getSession().getAttribute("customerID");
		
		List<ProductCartDTO> list = null;
	
		if(order_id != null) {
			list = dao.cart_List(order_id);
		}
		model.addAttribute("cart", list);

	}
	//카트에 상품 추가 처리
	@Override
	public void cart_ListAdd(HttpServletRequest req, Model model) {
		System.out.println("[Service] -> cart_ListAddAction");
		
		String order_id = (String)req.getSession().getAttribute("customerID");
		
		ProductCartDTO dto = new ProductCartDTO();
		//서비스에서 장바구니안에 데이터를 무엇을 넣을지를 생각.
		//1) 수량, 제품코드, customerID 
		if(order_id != null) {
			
		dto.setOrder_id(Integer.parseInt(req.getParameter("hiddenpdNo")));
		dto.setOrder_count(Integer.parseInt(req.getParameter("count")));
		dto.setOrder_name(req.getParameter("hiddenName"));
		dto.setOrder_price(Integer.parseInt(req.getParameter("hiddenPrice")));
		dto.setOrder_img(req.getParameter("hiddenpdImg"));
		dto.setUser_id(order_id);
		
		}
		//cart 상품 입력 
		int c_insert = dao.product_CartAdd(dto);
		
		model.addAttribute("c_insert", c_insert);
		
	}
	
	//카트 상품 삭제 처리
	@Override
	public void cart_ListDelete(HttpServletRequest req, HttpServletResponse res ,Model model) {
		System.out.println("[Service] -> cart_ListDelete");
		
		int delete_num = Integer.parseInt(req.getParameter("order_no"));
		
		int c_delete = dao.product_CartDelete(delete_num);
		
		req.setAttribute("c_delete", c_delete);
		
	}
	
	//카트 상품 전체 삭제
	@Override
	public void cart_ListAll_Delete(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("[Service] -> cart_ListAll_Delete");
		
		int deleteCnt = dao.proudct_CartDelete_All();
		
		req.setAttribute("deleteCnt", deleteCnt);
	}
	
	
}
