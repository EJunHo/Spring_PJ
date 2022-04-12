package com.spring_pj.LJH.dao;


import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring_pj.LJH.dto.MemberDTO;
import com.spring_pj.LJH.service.util.SettingValues;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int idCheck(String strId) {
		System.out.println("dao ID 중복 확인");

		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		
		int selectCnt = dao.idCheck(strId);
		
		return selectCnt;
	}

	@Override
	public int insertMember(MemberDTO dto) {
		System.out.println("dao 회원가입 처리");
		
		MemberDAO dao =	sqlSession.getMapper(MemberDAO.class);
		
		int insertCnt = dao.insertMember(dto);
		 
		return insertCnt;
	}

	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("dao로그인 처리 & 회원정보 인증");

		MemberDAO dao =	sqlSession.getMapper(MemberDAO.class);
		
		int selectCnt = dao.idPasswordChk(map);
		
		return selectCnt;
	}
	
	@Override
	public int deleteMember(String strId) {
	System.out.println("dao 회원정보 인증 및 탈퇴 처리");
		
		MemberDAO dao =	sqlSession.getMapper(MemberDAO.class);
		
		int deleteCnt = dao.deleteMember(strId);
		
		return deleteCnt;
	}

	@Override
	public MemberDTO getMemberDetail(String strId) {
		System.out.println("dao회원 인증 & 회원 상세");
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		
		MemberDTO dto =	dao.getMemberDetail(strId);
		
		return dto;
		
	}

	@Override
	public int updateMember(MemberDTO dto) {
		System.out.println("dao회원 수정");
		
		MemberDAO dao =	sqlSession.getMapper(MemberDAO.class);
		
		int updateCnt =	dao.updateMember(dto);
		
		return updateCnt;
	}

	@Override
	public void sendEmail(String email, String key) {
		System.out.println("dao sendEmail 처리");
		final String username = SettingValues.ADMIN;      // 본인 이메일
	    final String password = SettingValues.PW;      // 본인 비밀번호
	    final String host = "smtp.gmail.com";
	    
	    // SMTP(메일 서버) 설정
	      
	    // 아래 import는 pom.xml에 mail API를 설정해야 가능
	    // import java.util.Properties;
	    Properties props = new Properties();         
	    props.put("mail.smtp.user", username);         // SMTP에서 사용할 메일 주소
	    props.put("mail.smtp.password", password);      // 비밀번호
	    props.put("mail.smtp.host", host);            // host 서버 : gmail로 설정
	    props.put("mail.smtp.port", "25");            // 25번 포트 사용
	    props.put("mail.debug", "true");            // 디버그 설정
	    props.put("mail.smtp.auth", "true");         // 인증 : true
	    props.put("mail.smtp.starttls.enable", "true");   // tls 사용 허용
	    props.put("mail.smtp.ssl.enable", "true");      // ssl 허용
	    props.put("mail.smtp.ssl.trust", host);         // ssl 신뢰 가능으로 설정(보안레벨)

//	    props.put("mail.smtp.starttls.required", "true");
//	    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	    
	    // propert값 설정
	    props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
	    props.setProperty("mail.smtp.socketFactory.fallback", "false");
	    props.setProperty("mail.smtp.port", "465");
	    props.setProperty("mail.smtp.socketFactory.port", "465");
	      
	    // import javax.mail.Session;
	    // import javax.mail.Authenticator
	    // import javax.mail.PasswordAuthentication
	    Session session = Session.getInstance(props, new Authenticator() {
	    protected PasswordAuthentication getPasswordAuthentication() {
	    return new PasswordAuthentication(username, password);
	         }
	    });
	      
	    // import javax.mail.Message
	    // import javax.mail.internet.MimeMessage;
	    // import javax.mail.internet.InternetAddress;
	    // import javax.mail.Transport
	      
	    try {
	       Message message = new MimeMessage(session);
	       message.setFrom(new InternetAddress("admin@CosmoJspPJ.com"));
	       message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	       //localhost => 본인 IP주소 => 원격 발표시 IP 수정
	       //링크를 클릭해서 이메일 인증성공 => enabled가 1로 업데이트됨
	       String content ="회원가입을 축하드립니다. 링크를 눌러 회원가입을 완료하세요."
	                   + "<a href='http://localhost/LJH/emailChk.do?key=" + key + "'>링크</a>";
	       message.setSubject("회원가입 인증 메일");
	       message.setContent(content, "text/html; charset=utf-8");
	         
	       System.out.println("send");
	       Transport.send(message);
	       System.out.println("<<<< EMAIL SEND >>>>");
	    } catch(Exception e) {
	       e.printStackTrace();
	    }      
	}
	//인증 이메일 key 확인 - security
	@Override
	public int selectKey(String key) {
		
		//int selectCnt = sqlSession.selectOne("com.spring_pj.LJH.dao.MemberDAO.selectKey", key);
		MemberDAO dao =	sqlSession.getMapper(MemberDAO.class);
		
		int selectCnt = dao.selectKey(key);
		
		return selectCnt;
	}
	//security enabled key 변경
	@Override
	public int updateGrade(String key) {
		
		//int updateCnt = sqlSession.update("com.spring_pj.LJH.dao.MemberDAO.updateGrade", key);
		MemberDAO dao =	sqlSession.getMapper(MemberDAO.class);
		
		int updateCnt =	dao.updateGrade(key);
		
		return updateCnt;
	}
}
