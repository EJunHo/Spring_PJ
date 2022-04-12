package com.spring_pj.LJH.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring_pj.LJH.dto.ProductCartDTO;

@Repository
public interface ProductCartDAO {

	//장바구니 목록
	public List<ProductCartDTO>cart_List(String id);
	//장바구니에 상품 추가
	public int product_CartAdd(ProductCartDTO dto);
	//장바구니에서 상품 삭제
	public int product_CartDelete(int num);
	//장바구니에서 전체 상품 삭제
	public int proudct_CartDelete_All();
	//장바구니 상품 결제
	//public int product_CardConfirm(int num);
	//상품 카운트
	//public int product_Count();
	
}
