package com.spring_pj.LJH.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring_pj.LJH.dao.MemberDAO;
import com.spring_pj.LJH.dto.MemberDTO;
import com.spring_pj.LJH.service.util.EmailChkHandler;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder; //비밀번호 암호화 클래스
	
	@Override
	public void confirmAction(HttpServletRequest req, Model model) {
		String strId = req.getParameter("id");
		
		int selectCnt = dao.idCheck(strId);
		System.out.println("service : ID 중복점검" + selectCnt );
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("id", strId);
	}

	@Override
	public void signInAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 : signInAction");
		
		MemberDTO dto = new MemberDTO();
		
		dto.setId(req.getParameter("id"));
		
		//비밀번호 암호화 security
		String security_pwd = req.getParameter("password");
		System.out.println("암호화 전의 비밀번호 : " + security_pwd);
		
		String encrtyPassword = passwordEncoder.encode(security_pwd);
		System.out.println("암호화 후의 비밀번호 : " + encrtyPassword);
		
		dto.setPassword(encrtyPassword); //암호화 후의 비밀번호 선언
		
		dto.setName(req.getParameter("name")); 
		dto.setAddress(req.getParameter("address"));
		String strDate = req.getParameter("birthday");
		Date date = Date.valueOf(strDate);
		dto.setBirthday(date);
		String hp = "";
		String strHp1 = req.getParameter("hp1");
		String strHp2 = req.getParameter("hp2");
		String strHp3 = req.getParameter("hp3");
		
		if(!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
			hp = strHp1 + " " + strHp2 + " " + strHp3;
		}
		dto.setHp(hp);
		String email = "";
		String strEmail1 = req.getParameter("email1");
		String strEmail2 = req.getParameter("email2");
		email = strEmail1 + "@" + strEmail2;
		dto.setEmail(email);
	
		//security 이메일 키
		String key = EmailChkHandler.getKey();
		dto.setKey(key);
		
		int insertCnt = dao.insertMember(dto);
		if(insertCnt == 1) {
			
			dao.sendEmail(email, key); 	//이메일주소는 반드시 구글 계정이어야 한다.
			
		}
		
		System.out.println("서비스 insertCnt : " + insertCnt);
		model.addAttribute("insertCnt", insertCnt);
		
	}

	@Override
	public void loginAction(HttpServletRequest req, Model model) {
		String strId = req.getParameter("id");
		String strPassword = req.getParameter("password");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("strId", strId);
		map.put("strPassword", strPassword);
		
		int selectCnt = dao.idPasswordChk(map);
	
		if(selectCnt == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("customerID", strId);
		}
		
		System.out.println("서비스 - session : " + selectCnt);
		model.addAttribute("selectCnt", selectCnt);
	}

	@Override
	public void deleteMemberAction(HttpServletRequest req, Model model) {
		//3 단계 화면으로 부터 입력받은 값을 받아 dto에 담는다.
		String strId = (String)req.getSession().getAttribute("customerID");
		
		int	deleteCnt = dao.deleteMember(strId);
		//6단계 jsp로 결과 전달을 위해 setAttribute jsp에서 결과 출력을 보기 위해
		model.addAttribute("deleteCnt", deleteCnt);
		//4 단계 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		//5단계 로그인처리 확인을 위한 출력
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("strId", strId);
//		map.put("strPassword", strPassword);
//		
//		int selectCnt = dao.idPasswordChk(map);
//		
//		int deleteCnt = 0;
//		
//		if(selectCnt == 1) {
//			deleteCnt = dao.deleteMember(strId);
//			System.out.println("deleteCnt : " + deleteCnt);
//		}
//	
//		//6단계 jsp로 결과 전달을 위해 setAttribute jsp에서 결과 출력을 보기 위해
//		model.addAttribute("deleteCnt", deleteCnt);
//		model.addAttribute("selectCnt", selectCnt);
		
	}

	@Override
	public void modifyDeteailAction(HttpServletRequest req, Model model) {
		System.out.println("서비스 : modifyDetailAction");
		String strId = (String)req.getSession().getAttribute("customerID");

		MemberDTO dto = dao.getMemberDetail(strId);
		
		model.addAttribute("dto", dto);
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("strId", strId);
//		map.put("strPassword", strPassword);
//		
//		int selectCnt = dao.idPasswordChk(map);
//
//		MemberDTO dto = null;
//
//		if(selectCnt == 1) {
//			dto = dao.getMemberDetail(strId);
//		}
//		model.addAttribute("selectCnt", selectCnt);
//		model.addAttribute("dto", dto);
		
	}

	@Override
	public void modifyMemberAction(HttpServletRequest req, Model model) {
		
		MemberDTO dto = new MemberDTO();
		
		String strID = (String)req.getSession().getAttribute("customerID");
		dto.setId(strID);
		//security 암호화 부분
		String security_pwd = req.getParameter("password");
		System.out.println("암호화 전의 비밀번호 : " + security_pwd);
		
		String encrtyPassword = passwordEncoder.encode(security_pwd);
		System.out.println("암호화 후의 비밀번호 : " + encrtyPassword);
		
		dto.setPassword(encrtyPassword);
		
		dto.setName(req.getParameter("name"));
		String strDate = req.getParameter("birthday");
		Date date = Date.valueOf(strDate);
		dto.setBirthday(date);
		dto.setAddress(req.getParameter("address"));
		String strHp1 = req.getParameter("hp1");
		String strHp2 = req.getParameter("hp2");
		String strHp3 = req.getParameter("hp3");
		String hp = " ";
		//HP값에 Null이 없다면 
	    if(!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
	         hp = strHp1 + "-" + strHp2 + "-" + strHp3;
	      }
		dto.setHp(hp);
		String email = "";
		String strEmail1 = req.getParameter("email1"); 
		String strEmail2 = req.getParameter("email2"); 
		email = strEmail1 + "@" + strEmail2;
		dto.setEmail(email);
		
		int updateCnt = dao.updateMember(dto);
		
		System.out.println("서비스 : updateCnt" + updateCnt);
		
		model.addAttribute("updateCnt", updateCnt);
		
	}

	@Override
	public void emailCheckAction(HttpServletRequest req, Model model) {
		
		String key = req.getParameter("key");
		
		int selectCnt = dao.selectKey(key);
		
		if(selectCnt == 1) {
			int insertCnt = dao.updateGrade(key);
			model.addAttribute("insertCnt", insertCnt);
		}
		System.out.println("서비스 이메일 : " + selectCnt );
	}
}
