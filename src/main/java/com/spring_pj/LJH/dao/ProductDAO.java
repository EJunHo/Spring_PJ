package com.spring_pj.LJH.dao;

import java.util.List;
import java.util.Map;

import com.spring_pj.LJH.dto.ConfrimOrderDTO;
import com.spring_pj.LJH.dto.ProductDTO;


public interface ProductDAO {
	
	//상품 목록
	public List<ProductDTO>product_List(Map<String, Object> map);
	//상품 추가 처리
	public int product_Insert(ProductDTO dto);
	//상품 상품 상세페이지
	public ProductDTO product_Detail(int pdNo);
	//상품 수정 처리
	public int product_Update(ProductDTO dto);
	//상품 삭제처리
	public int product_Delete(int pdNo);
	//상품 수량 증가
//	public int count_Increase(int count, int id);
//	//상품 수량 감소
//	public int count_decrease(int count, int id);
	//상품 페이지 확인을 위한 카운트
	public int product_Count();
	//차트 결산용 - 일별
	public List<ConfrimOrderDTO> product_Account();
	//차트 결산용 - 카테고리별
	public List<ConfrimOrderDTO> product_Account_category();
	

}