package com.spring_pj.LJH.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring_pj.LJH.dao.BoardDAO;
import com.spring_pj.LJH.dto.boardDTO;
import com.spring_pj.LJH.dto.commentDTO;

import page.Paging;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Override
	public void board_List(HttpServletRequest req, Model model) {
		System.out.println("서비스 - 게시글 목록 리스트 출력");
		
		String pageNum = req.getParameter("pageNum");
		
		Paging page = new Paging(pageNum);
		int total = dao.board_count();
		page.setTotalCount(total);
		int start = page.getStartRow();
		int end = page.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		
		List<boardDTO> list = dao.board_List(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", page);
	}
	
	@Override
	public void board_Insert(HttpServletRequest req, Model model) {
		System.out.println("서비스 - 게시글 목록 작성");
		
		//3단계 화면으로부터 입력받은 값을 dto에 담는다.
		boardDTO dto = new boardDTO();
				
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setWriter(req.getParameter("writer"));
		dto.setPassword(req.getParameter("password"));
		
		//싱글톤 방식으로 dao 객체 생성
		//5단계 게시글 저장
		int insertCnt = dao.board_Insert(dto);
		System.out.println("서비스 - insertCnt : " + insertCnt);
		//setAttribute로 처리 결과 전달
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void board_Detail(HttpServletRequest req, Model model) {
		System.out.println("서비스 - 게시글 상세");
		
		int num = 0;
		boardDTO dto = new boardDTO();
		num = Integer.parseInt(req.getParameter("num"));
		
		dao.board_Read_Count(num);
		
		dto = dao.board_Detail(num);
		
		model.addAttribute("dto", dto);
	}

	@Override
	public void board_Update(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("서비스 - boardUpdate");
		
		boardDTO dto = new boardDTO();
		int updateCnt = 0;
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setWriter(req.getParameter("writer"));
		dto.setPassword(req.getParameter("password"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		updateCnt = dao.board_Update(dto);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}

	@Override
	public void board_Delete(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("서비스 - board_Delete");
		
		int num = Integer.parseInt(req.getParameter("num"));
		System.out.println("삭제할 게시글 글번호 : " + num);
		//4단계 DAO 싱글톤 생성
		//5단계
		int deleteCnt = dao.board_Delete(num);
		//6단계
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public String board_PasswordCheck(HttpServletRequest req, HttpServletResponse res ,Model model) throws ServletException, IOException {
		System.out.println("서비스 - PasswordCheck");
		
		int num = Integer.parseInt(req.getParameter("num"));
		String password = req.getParameter("password");
		System.out.println("num : " + num + "password" + password);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("password", password);
		
		String result = dao.board_password(map);
	
		return result;
	}
	

	@Override
	public void comment_Add(HttpServletRequest req, Model model) {
		System.out.println("서비스 - comment_Add");

		commentDTO dto = new commentDTO();
		dto.setBoard_num(Integer.parseInt(req.getParameter("board_num")));
		dto.setWriter(req.getParameter("writer"));
		dto.setConsole(req.getParameter("console"));
		
		//5단계 댓글 insert
		dao.board_Comment_Insert(dto);
	}

	@Override
	public void comment_List(HttpServletRequest req, Model model) {
		System.out.println("서비스 - comment_List");
		
		//3단계 화면에서 값을 받는다.
		int board_num = Integer.parseInt(req.getParameter("num"));
		//4단계 
		List<commentDTO> list =  dao.board_comment_List(board_num);
	
		model.addAttribute("list", list);
	}
}

