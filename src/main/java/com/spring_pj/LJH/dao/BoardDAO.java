package com.spring_pj.LJH.dao;

import java.util.List;
import java.util.Map;

import com.spring_pj.LJH.dto.boardDTO;
import com.spring_pj.LJH.dto.commentDTO;


public interface BoardDAO {
	//게시글 갯수
	public int board_count();
	//게시글 목록
	public List<boardDTO> board_List(Map<String, Object> map);
	//게시글 상세
	public boardDTO board_Detail(int num);
	//게시글 작성
	public int board_Insert(boardDTO dto);
	//게시글 수정
	public int board_Update(boardDTO dto);
	//게시글 삭제
	public int board_Delete(int num);
	//댓글 추가 확인
	public void board_Comment_Insert(commentDTO dto);
	//댓글 목록 리스트
	public List<commentDTO> board_comment_List(int board_num);
	//비밀번호 인증
	public String board_password(Map<String, Object> map);
	//조회수 증가
	public void board_Read_Count(int num);
	
}
