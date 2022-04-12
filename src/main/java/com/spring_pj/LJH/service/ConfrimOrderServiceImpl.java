package com.spring_pj.LJH.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring_pj.LJH.dao.ConfrimOrderDAO;
import com.spring_pj.LJH.dao.ProductCartDAO;
import com.spring_pj.LJH.dto.ConfrimOrderDTO;

import page.Paging;

@Service
public class ConfrimOrderServiceImpl implements ConfrimOrderService{

	@Autowired
	ConfrimOrderDAO dao;
	
	@Autowired
	ProductCartDAO pd_dao;
	
	//주문승인 처리
	@Override
	public void confirm_Order_Action(HttpServletRequest req, Model model) {
		System.out.println("서비스 - confirm_Order_Action ");
	
		int insertCnt = 0;
		String address = "";
		//dao 선언
		
		//1 단계 화면에서 값을 넘겨받는다.
		String [] item_no = req.getParameterValues("pdid");
		String [] item_arr = req.getParameterValues("cart_arr_item");
		String [] item = item_arr[0].split(",");
				
		String confirm_id = (String)req.getSession().getAttribute("customerID");
		String [] confirm_name = req.getParameterValues("hiddenpdName");
		String [] confirm_price = req.getParameterValues("hiddenPrice");
		String [] confirm_count = req.getParameterValues("hiddenCount");
		/*	주소 받기	 */
		String  zipCode = req.getParameter("zipcode1");
		String  addr1 = req.getParameter("addr1");
		String  addr2 = req.getParameter("addr2");
		if(!zipCode.equals("") && !addr1.equals("") && !addr2.equals("")) {
			address= zipCode + " " + addr1 + " " + addr2 ;
		}
		/*	핸드폰번호 */
		String phone = "";
		String strHp1 = req.getParameter("phone1");
		String strHp2 = req.getParameter("phone2");
		String strHp3 = req.getParameter("phone3");
		if(!strHp1.equals("") && !strHp2.equals("") && !strHp3.equals("")) {
			phone = strHp1 + "-" + strHp2 + "-" + strHp3;
		}
		/* 이메일 입력	*/
		String email = "";
		String strEmail1 = req.getParameter("email1");
		String strEmail2 = req.getParameter("email2");
		email = strEmail1 + "@" + strEmail2;
		
		List<ConfrimOrderDTO> confirm_list = null;
		
		for(int i=0; i<item.length; i++) {
			
			confirm_list = new ArrayList<ConfrimOrderDTO>();
			ConfrimOrderDTO dto = new ConfrimOrderDTO();
			//넘겨받은 값을 dto에 저장
			dto.setPd_no(Integer.parseInt(item_no[i]));
			dto.setConfirm_id(confirm_id);	//customer_id get
			dto.setConfirm_state("승인대기");
			dto.setConfirm_email(email);
			dto.setConfirm_phone(phone);
			dto.setConfirm_address(address);
			dto.setConfirm_name(confirm_name[i]);	//제품명
			dto.setConfirm_price(Integer.parseInt(confirm_price[i]));	//제품가격
			dto.setConfirm_count(Integer.parseInt(confirm_count[i]));	//주문수량
			
			confirm_list.add(dto);
			
			System.out.println("confirm_list : " + confirm_list);
			insertCnt = dao.confirm_Order_Add(confirm_list);
			
		}
			
		//장바구니 전체 삭제
		pd_dao.proudct_CartDelete_All();

		model.addAttribute("confirm_item", insertCnt);
	}
	
	//주문 페이지 - manager
	@Override
	public void confirm_Order_List(HttpServletRequest req, Model model) {
		System.out.println("서비스 - confirm_Order_List ");
		//페이징 처리
		String pageNum = req.getParameter("pageNum");
		Paging page = new Paging(pageNum);
		int total = dao.order_Count();
		//페이지 카운트
		page.setTotalCount(total);
		//페이지 별 시작번호
		int start = page.getStartRow();
		//페이지 별 끝 번호
		int end = page.getEndRow();
		List<ConfrimOrderDTO> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		
		list = dao.confirm_Order_List(map);
		
		model.addAttribute("confirm", list);
		model.addAttribute("paging", page);
	}
	
	//주문페이지 - customer
	@Override
	public void private_Order_item(HttpServletRequest req, Model model) {
		System.out.println("서비스 - private_Order_item ");
		//session
		String confirm_id = (String)req.getSession().getAttribute("customerID");
		//페이징 처리
		String pageNum = req.getParameter("pageNum");
		Paging page = new Paging(pageNum);
		int total = dao.order_Count();
		//페이지 카운트
		page.setTotalCount(total);
		//페이지 별 시작번호
		int start = page.getStartRow();
		//페이지 별 끝 번호
		int end = page.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("confirm_id", confirm_id);
		map.put("start", start);
		map.put("end", end);
		
		List<ConfrimOrderDTO> list = dao.private_Order_List(map);
		
		model.addAttribute("confirm", list);
		model.addAttribute("paging", page);
	}
	
	//상품 승인 - manager
	@Override
	public void confirm_Action(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("서비스 - confirm_Action ");
		int no = Integer.parseInt(req.getParameter("delivery_no"));
		int pd_count = Integer.parseInt(req.getParameter("order_count"));
	
		System.out.println("no : " + no);
		System.out.println("pd_count : " + pd_count);
		
		int updateCnt = dao.approve_Order(no);
		model.addAttribute("updateCnt", updateCnt);
		
	}
	
	//상품 취소 - manager
	@Override
	public void confirm_Cancle_Action(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("서비스 - confirm_Cancle_Action ");
		
		int no = Integer.parseInt(req.getParameter("delivery_no"));
		int pd_count = Integer.parseInt(req.getParameter("order_count"));
		
		System.out.println("no : " + no);
		System.out.println("pd_count : " + pd_count);
	
		int cancleCnt = dao.cancle_Order(no);
		model.addAttribute("cancleCnt", cancleCnt);
	}
	
	//제품 환불 - customer
	@Override
	public void refund_Action(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("서비스 - confirm_Cancle_Action ");
		
		int no = Integer.parseInt(req.getParameter("delivery_no"));
		int pd_count = Integer.parseInt(req.getParameter("order_count"));
		
		System.out.println("no : " + no);
		System.out.println("pd_count : " + pd_count);
		
		int refundCnt = dao.order_refund(no);
		req.setAttribute("refundCnt", refundCnt);
	}
	
	//구매 취소 - customer
	@Override
	public void cancle_Action(HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("서비스 - confirm_Cancle_Action ");
		
		int no = Integer.parseInt(req.getParameter("delivery_no"));
		int pd_count = Integer.parseInt(req.getParameter("order_count"));
		
		System.out.println("no : " + no);
		System.out.println("pd_count : " + pd_count);
		
		int calcneCnt = dao.order_cancle(no);
		req.setAttribute("calcneCnt", calcneCnt);
	}
	//결산 리스트 - manager
	@Override
	public void account_List(HttpServletRequest req, Model model) {
		System.out.println("서비스 - account_List ");
		//페이징 처리
		String pageNum = req.getParameter("pageNum");
		Paging page = new Paging(pageNum);
		int total = dao.order_Count();
		//페이지 카운트
		page.setTotalCount(total);
		//페이지 별 시작번호
		int start = page.getStartRow();
		//페이지 별 끝 번호
		int end = page.getEndRow();
		List<ConfrimOrderDTO> list = null;
		
		Map<String, Object>	map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		
		list = dao.account_list(map);
		
		req.setAttribute("account", list);
		req.setAttribute("paging", page);
	}

	@Override
	public void refund_Manager(HttpServletRequest req, Model model) {
		System.out.println("서비스 - refund_Manager ");
		//페이징 처리
		String pageNum = req.getParameter("pageNum");
		Paging page = new Paging(pageNum);
		int total = dao.order_Count();
		//페이지 카운트
		page.setTotalCount(total);
		//페이지 별 시작번호
		int start = page.getStartRow();
		//페이지 별 끝 번호
		int end = page.getEndRow();
		List<ConfrimOrderDTO> list = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		
		list = dao.refund_list(map);
		
		req.setAttribute("refund", list);
		req.setAttribute("paging", page);
	}
}
