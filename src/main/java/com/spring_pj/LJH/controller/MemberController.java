package com.spring_pj.LJH.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_pj.LJH.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService service;
	
	/*  
	 * 시작 화면 
	*/
	@RequestMapping("main.do")
	public String main() {
		logger.info("[URL Controller] - > [Main] ");
		
		return "common/main";
	}
	/* 
	 * 회원가입
	*/
	@RequestMapping("join.do")
	public String join() {
		logger.info("[URL Controller] - > [join] ");
		
		return "customer/customer_Join/customer_join";
	} 
	/* 
	 * 회원 중복 처리
	*/
	@RequestMapping("confirmIdAction.do")
	public String confirmIdAction(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [confirmIdAction] ");
		
		service.confirmAction(req, model);
		
		return "customer/customer_Join/confirmIdAction";
	}
	/* 
	 * 회원 가입 처리
	*/
	@RequestMapping("joinAction.do")
	public String joinAction(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [joinAction] ");
		
		service.signInAction(req, model);
		
		return "customer/customer_Join/joinAction";
	}
	/* 
	 * 회원 가입 성공
	*/
	@RequestMapping("mainSuccess.do")
	public String mainSuccess(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [mainSuccess] ");
		
		int cnt = Integer.parseInt(req.getParameter("insertCnt"));
		
		model.addAttribute("selectCnt", cnt);
		
		return "customer/customer_Login/login"; 
	}
	/* 
	 * 회원 로그인
	*/
	@RequestMapping("login.do")
	public String login(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [login] ");
		model.addAttribute("selectCnt", 2);
		
		return "customer/customer_Login/login";
	}
	// sendEmail(String email, String key)
	@RequestMapping("emailChk.do")
	public String emailChk(HttpServletRequest req, Model model) {
		logger.info("url 호출 : emailChk");
		
		service.emailCheckAction(req, model);
		return "customer/customer_Join/emailCheckAction";
	}
	
	/* 
	 * 회원 로그인 처리
	 * security 적용으로 사용 안함
	*/
//	@RequestMapping("loginAction.do")
//	public String loginAction(HttpServletRequest req, Model model) {
//		logger.info("[URL Controller] - > [loginAction] ");
//		
//		service.loginAction(req, model);
//		
//		return "customer/customer_Login/loginAction";
//	}
	/* 
	 * 회원 로그아웃
	*/
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [logout] ");
		
		req.getSession().invalidate();
		
		return "common/main";
	}
	/* 
	 * 회원 정보 수정
	*/
	@RequestMapping("modifyCustomer.do")
	public String modifyCustomer(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [modifyCustomer] ");
		
		
		return "customer/customer_Page/mypage/modifyCustomer";
	}
	
	/* 
	 * 회원 정보 수정 처리
	*/
	@RequestMapping("modifyDetailAction.do")
	public String modifyDetailAction(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [modifyDetailAction] ");
		
		service.modifyDeteailAction(req, model);
		
		return "customer/customer_Page/mypage/modifyDetailAction";
	}
	
	/* 
	 * 회원 정보 수정
	*/
	@RequestMapping("modifyCustomerAction.do")
	public String modifyCustomerAction(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [modifyCustomerAction] ");
		
		service.modifyMemberAction(req, model);
		
		return "customer/customer_Page/mypage/modifyCustomerAction";
	}
	
	/* 
	 * 회원 정보 삭제
	*/
	@RequestMapping("deleteCustomer.do")
	public String deleteCustomer(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [deleteCustomer] ");
		
		return "customer/customer_Page/mypage/deleteCustomer";
	}
	
	/* 
	 * 회원 정보 삭제 처리
	*/
	@RequestMapping("deleteCustomerAction.do")
	public String deleteCustomerAction(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [deleteCustomerAction] ");
		
		service.deleteMemberAction(req, model);
		
		return "customer/customer_Page/mypage/deleteCustomerAction";
	}
	
}
