package com.spring_pj.LJH.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring_pj.LJH.dto.ConfrimOrderDTO;
import com.spring_pj.LJH.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	ProductDAO dao;
	
	@Override
	public int product_Count() {
	   //sql 페이지 갯수를 구하기 위한 선언 as cnt
	   dao = sqlSession.getMapper(ProductDAO.class);
	   int selectCnt = dao.product_Count();	
	   
	   return selectCnt; 
	  	
	}
	
	@Override
	public List<ProductDTO> product_List(Map<String, Object> map) {
		System.out.println("DAO - productList");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		List<ProductDTO> list = dao.product_List(map);
		
	      return list;
	   }
	
	@Override
	public int product_Insert(ProductDTO dto) {
		System.out.println("DAO - product_Insert");
	
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		int insertCnt = dao.product_Insert(dto);
		 
		return insertCnt;
	}

	@Override
	public ProductDTO product_Detail(int pdNo) {
		System.out.println("DAO - product_Detail");

		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		ProductDTO dto = dao.product_Detail(pdNo);
		return dto;
	}

	@Override
	public int product_Update(ProductDTO dto) {
		System.out.println("DAO - product_Update");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		int updateCnt = dao.product_Update(dto);
		return updateCnt;
	}

	@Override
	public int product_Delete(int pdNo) {
		System.out.println("DAO - product_Delete");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		int deleteCnt =	dao.product_Delete(pdNo);
		
		return deleteCnt;
	
	}
//	@Override
	//id 제품번호, count 구매 수량
//	public int count_Increase(int count, int id) {
//			String sql = "SELECT count FROM mvc_pdlist_tbl WHERE no=?";
//				String sql_1 = "UPDATE mvc_pdlist_tbl SET count=? WHERE no=?";
//		}
//			
//		return increaCnt;
//		
//	}
//	@Override
//	public int count_decrease(int count, int id) {
//		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		int decreaseCnt = 0;
//		
//		try {
//			conn = dataSource.getConnection();
//			String sql = "SELECT count FROM mvc_pdlist_tbl WHERE no=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, id);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				
//				String sql_1 = "UPDATE mvc_pdlist_tbl SET count=? WHERE no=?";
//				int test = rs.getInt("count");
//				int save = test - count;
//				
//				pstmt = conn.prepareStatement(sql_1);
//				pstmt.setInt(1, save);
//				pstmt.setInt(2, id);
//				
//				decreaseCnt = pstmt.executeUpdate();
//			}
//			
//			System.out.println("DAO - decreaseCnt");
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			
//		} try {
//			if(pstmt!=null) pstmt.close();
//			if(conn!=null) conn.close();
//			if(rs!=null) rs.close();
//		} catch(SQLException e) {   
//			e.printStackTrace();
//		}
//			
//		return decreaseCnt;
//	}
	//일별 결산용 데이터
	@Override
	public List<ConfrimOrderDTO> product_Account() {
		System.out.println("DAO - product_Account");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		
		List<ConfrimOrderDTO> list =  dao.product_Account();
		
		return list;
	}

	@Override
	public List<ConfrimOrderDTO> product_Account_category() {
		System.out.println("DAO - product_Account_category");
		
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		
		List<ConfrimOrderDTO> list = dao.product_Account_category();
		
		return list;
	}
}
