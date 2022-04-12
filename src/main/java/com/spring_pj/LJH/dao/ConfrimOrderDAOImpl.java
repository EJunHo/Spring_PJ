package com.spring_pj.LJH.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring_pj.LJH.dto.ConfrimOrderDTO;

@Repository
public class ConfrimOrderDAOImpl implements ConfrimOrderDAO{

	@Autowired
	SqlSession sqlSession;
	// 장바구니 구매 진행
	@Override
	public int confirm_Order_Add(List<ConfrimOrderDTO> c_list) {
		System.out.println("dao confirm_Order_Add 시작");
		ConfrimOrderDAO dao = null;
		  
		int insertCnt = 0;
		
		dao =  sqlSession.getMapper(ConfrimOrderDAO.class);
		
		insertCnt = dao.confirm_Order_Add(c_list);
	
		
	  return insertCnt;
	}

	//주문 조회 리스트 - manager
	@Override
	public List<ConfrimOrderDTO> confirm_Order_List(Map<String, Object> map) {
		System.out.println("dao confirm_Order_List 시작");
			
		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		
		List<ConfrimOrderDTO> list = dao.confirm_Order_List(map);
		
		return list;
	}
	//주문조회 카운트 - Paging 처리
	@Override
	public int order_Count() {
		
	    //sql 페이지 갯수를 구하기 위한 선언 as cnt
		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		 
		return dao.order_Count();
	}
	//customer 주문조회 리스트
	@Override
	public List<ConfrimOrderDTO> private_Order_List(Map<String, Object> map) {
		System.out.println("dao confirm_Order_List 시작");
				
		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		
		List<ConfrimOrderDTO> list = dao.private_Order_List(map);
		
		return list;
	}
	//관리자 제품 승인 
	@Override
	public int approve_Order(int order_no) {
		System.out.println("DAO - approve_Order");

		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		
		int updateCnt = dao.approve_Order(order_no);
		
		return updateCnt;
		}
	
	@Override
	public int cancle_Order(int order_no) {
		System.out.println("DAO - cancle_Order");

		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		
		int updateCnt = dao.cancle_Order(order_no);
		
		return updateCnt;
	}
	//구매 취소 - customer
	@Override
	public int order_cancle(int order_no) {
		System.out.println("DAO - cancle_Order");

		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		
		int updateCnt =	dao.order_cancle(order_no);
		
		return updateCnt;
	}
	//고객 환불요청
	@Override
	public int order_refund(int order_no) {
		System.out.println("DAO - order_refund");	
		
		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		
		int updateCnt =	dao.order_refund(order_no);
		
		return updateCnt;
	}
//	//재고수량 수정
//	@Override
//	public void product_Count(int pd_count) {
//		
//		
//	}
	//결산 리스트 - manager 페이지
	@Override
	public List<ConfrimOrderDTO> account_list(Map<String, Object> map) {
		System.out.println("DAO - account_list");	
		
		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		
		List<ConfrimOrderDTO> list = dao.account_list(map);
		
		return list;
	}
	
	//환불요청 리스트 - manager
	@Override
	public List<ConfrimOrderDTO> refund_list(Map<String, Object> map) {
		System.out.println("DAO - refund_list");	
		
		ConfrimOrderDAO dao = sqlSession.getMapper(ConfrimOrderDAO.class);
		
		List<ConfrimOrderDTO> list = dao.refund_list(map);
		
		return list;
	}
}
