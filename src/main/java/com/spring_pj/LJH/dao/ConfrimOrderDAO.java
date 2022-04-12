package com.spring_pj.LJH.dao;

import java.util.List;
import java.util.Map;

import com.spring_pj.LJH.dto.ConfrimOrderDTO;


public interface ConfrimOrderDAO {

	//장바구니에서 구매리스트 입력
	public int confirm_Order_Add(List<ConfrimOrderDTO> c_list);
	//장바구니 내역리스트 
	public List<ConfrimOrderDTO> confirm_Order_List(Map<String, Object> map);
	//개인 주문조회
	public List<ConfrimOrderDTO> private_Order_List(Map<String, Object> map);
	//주문 승인
	public int approve_Order(int order_no);
	//주문 취소	
	public int cancle_Order(int order_no);
	//구매 취소
	public int order_cancle(int order_no);
	//구매 환불
	public int order_refund(int order_no);
	//구매 리스트 페이징처리 
	public int order_Count();
	//재고 수량 Count
//	public void product_Count(int pd_count);
	//결산 리스트
	public List<ConfrimOrderDTO> account_list(Map<String, Object> map);
	//환불 리스트
	public List<ConfrimOrderDTO> refund_list(Map<String, Object> map);
	

}