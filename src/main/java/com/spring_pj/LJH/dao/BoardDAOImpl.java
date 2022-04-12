package com.spring_pj.LJH.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring_pj.LJH.dto.boardDTO;
import com.spring_pj.LJH.dto.commentDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int board_count() {
	    //sql 페이지 갯수를 구하기 위한 선언 as cnt
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
	    return dao.board_count();
	}

	@Override
	public List<boardDTO> board_List(Map<String, Object> map) {
		System.out.println("DAO - board_List 출력");
	    
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<boardDTO> dto = dao.board_List(map);
		return dto;
	   }

	@Override
	public boardDTO board_Detail(int num) {
		System.out.println("DAO - board_Detail 출력");

		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		boardDTO dto = dao.board_Detail(num);
		return dto;
	}
	
	@Override
	public int board_Insert(boardDTO dto) {
		System.out.println("DAO - board_Insert");

		BoardDAO dao = 	sqlSession.getMapper(BoardDAO.class);
		
		int insertCnt = dao.board_Insert(dto);
		
		return insertCnt;
	}

	@Override
	public int board_Update(boardDTO dto) {
		System.out.println("DAO - board_Insert");

		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		int updateCnt = dao.board_Update(dto);
		
		return updateCnt;
	}

	@Override
	public int board_Delete(int num) {
		System.out.println("DAO - deleteBoard");
			
		BoardDAO dao = 	sqlSession.getMapper(BoardDAO.class);
		
		int deleteCnt = dao.board_Delete(num);
		
		return deleteCnt;
	}

	@Override
	public void board_Comment_Insert(commentDTO dto) {
		System.out.println("DAO - board_Comment_Insert");

		BoardDAO dao =	sqlSession.getMapper(BoardDAO.class);
		dao.board_Comment_Insert(dto);
	}

	@Override
	public List<commentDTO> board_comment_List(int board_num) {
		System.out.println("DAO - board_comment_List");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<commentDTO> dto = dao.board_comment_List(board_num);
	
		return dto;
	}

	@Override
	public String board_password(Map<String, Object> map) {
		System.out.println("DAO - board_password");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		String result = dao.board_password(map);
		
		return result;
	}

	@Override
	public void board_Read_Count(int num) {
		System.out.println("DAO - plusReadCnt");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		dao.board_Read_Count(num);
	
	}
}
