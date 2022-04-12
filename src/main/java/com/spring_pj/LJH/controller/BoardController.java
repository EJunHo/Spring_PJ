package com.spring_pj.LJH.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_pj.LJH.dao.BoardDAO;
import com.spring_pj.LJH.dto.boardDTO;
import com.spring_pj.LJH.service.BoardService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	@Autowired
	BoardDAO dao = null;
	String viewPage = "";
	
	@RequestMapping("boardList.bo")
	public String boardList(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[URL Controller] - > [boardList]");
		
		service.board_List(req, model);
		
		return "manager/csCenter/boardList";
	}
	
	@RequestMapping("board_Insert.bo")
	public String board_Insert(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [board_Insert]");
		
		return "manager/csCenter/board_Insert";
	}

	@RequestMapping("board_InsertAction.bo")
	public String board_InsertAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[URL Controller] - > [board_InsertAction]");
		
		service.board_Insert(req, model);
		
		return "manager/csCenter/board_InsertAction";
	}
	
	@RequestMapping("board_DetailAction.bo")
	public String board_DetailAction(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[URL Controller] - > [board_DetailAction]");
		
		service.board_Detail(req, model);
		
		return "manager/csCenter/board_DetailAction";
	}
	
	@RequestMapping("passwordCHk.bo")
	public String passwordCHk(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException {
		logger.info("[URL Controller] - > [passwordCHk]");
		
		String result = service.board_PasswordCheck(req, res, model);
		String viewPage = "";
		int num = Integer.parseInt(req.getParameter("num"));
		
		if(result != null) {
			viewPage = "manager/csCenter/board_edit.jsp";
			boardDTO dto = dao.board_Detail(num);
			
			model.addAttribute("dto", dto);
			
			return "manager/csCenter/board_edit";
				
		} else {
			viewPage = req.getContextPath() + "/board_DetailAction.bo?num=" + num + "&message=error";
			
			res.sendRedirect(viewPage);
			return null;
		}
	}
	
	@RequestMapping("board_updateAction.bo")
	public void board_updateAction(HttpServletRequest req, HttpServletResponse res ,Model model) throws IOException, ServletException {
		logger.info("[URL Controller] - > [board_updateAction]");
	
		service.board_Update(req, res, model);
		
		viewPage = req.getContextPath() + "/boardList.bo";
		res.sendRedirect(viewPage);
	}
	
	@RequestMapping("board_DeleteAction.bo")
	public void board_DeleteAction(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException, ServletException {
		logger.info("[URL Controller] - > [board_DeleteAction]");
	
		service.board_Delete(req, res, model);
		
		viewPage = req.getContextPath() + "/boardList.bo";
		res.sendRedirect(viewPage);
	}
	
	@RequestMapping("commentAdd.bo")
	public void commentAdd(HttpServletRequest req, HttpServletResponse res ,Model model) throws ServletException, IOException {
		logger.info("[URL Controller] - > [commentAdd]");
		
		service.comment_Add(req, model);
		
		viewPage = req.getContextPath() + "/boardList.bo";
		res.sendRedirect(viewPage);
	}
	
	@RequestMapping("commentList.bo")
	public String commentList(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[URL Controller] - > [commentList]");
		
		service.comment_List(req, model);
		
		return "manager/csCenter/commentList";
	}
	
	@RequestMapping("logout.bo")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("Controller - logout");
		
		req.getSession().invalidate();
		
		return "common/main";
	}
	
	@RequestMapping("member_commnu.bo")
	public String member_commnu(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[URL Controller] - > [member_commnu]");
		
		service.board_List(req, model);
		
		return "customer/commnunity/commnunity";
		
	}
	
	@RequestMapping("commnunity_Detail.bo")
	public String member_commnu_detail(HttpServletRequest req, Model model) throws ServletException, IOException {
		logger.info("[URL Controller] - > [commnunity_Detail]");
		
		service.board_Detail(req, model);
		
		return "customer/commnunity/commnunity_Detail";
	}
	
	
}
