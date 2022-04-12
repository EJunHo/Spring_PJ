package com.spring_pj.LJH.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring_pj.LJH.dto.ProductCartDTO;


@Repository
public class ProductCartDAOImpl implements ProductCartDAO{

	@Autowired
	SqlSession sqlSession;
	
	//장바구니 리스트 출력
	@Override
	public List<ProductCartDTO> cart_List(String id) {
		System.out.println("서비스 - cart_List");
		
		ProductCartDAO dao = sqlSession.getMapper(ProductCartDAO.class);
		
		List<ProductCartDTO> list = dao.cart_List(id);
	    
		return list;
}
	//장바구니 상품 추가
	@Override
	public int product_CartAdd(ProductCartDTO dto) {
		System.out.println("서비스 - product_CartAdd");
	
		ProductCartDAO dao = sqlSession.getMapper(ProductCartDAO.class);
		
		int cart_insertCnt = dao.product_CartAdd(dto);
		
		return cart_insertCnt;
	}
	
	//장바구니 상품 개별 삭제
	@Override
	public int product_CartDelete(int num) {
		System.out.println("서비스 - product_CartDelete");
		
		ProductCartDAO dao = sqlSession.getMapper(ProductCartDAO.class);
		
		int deleteCnt =	dao.product_CartDelete(num);
		
		return deleteCnt;
	
	}
	//장바구니 전체 삭제
	@Override
	public int proudct_CartDelete_All() {
		System.out.println("서비스 - cart_List");
		
		ProductCartDAO dao = sqlSession.getMapper(ProductCartDAO.class);
			
		int deleteCnt = dao.proudct_CartDelete_All();
		
		return deleteCnt;
	}
}
