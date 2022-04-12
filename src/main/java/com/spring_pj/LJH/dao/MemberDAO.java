package com.spring_pj.LJH.dao;

import java.util.Map;

import com.spring_pj.LJH.dto.MemberDTO;

public interface MemberDAO {
	//ID 중복 확인 처리
	public int idCheck(String strId);
	//회원 가입
	public int insertMember(MemberDTO dto);
	//로그인 및 회원 인증
	public int idPasswordChk(Map<String, Object> map);
	//회원 인증 및 탈퇴
	public int deleteMember(String strId);
	//회원 상세 페이지
	public MemberDTO getMemberDetail(String strId);
	//회원 수정
	public int updateMember(MemberDTO dto);
	//security 추가 이메일 전송
	public void sendEmail(String email, String key);
	//인증 이메일 key 확인 - security
	public int selectKey(String key);
	//security enabled key 변경
	public int updateGrade(String key);
	//authorityCheck
	
	
	
}
