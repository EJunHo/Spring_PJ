package com.spring_pj.LJH.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProductService {
	public void pd_Insert_Action(MultipartHttpServletRequest req, Model model);
	
	public void pd_List(HttpServletRequest req, Model model);
	
	public void pd_Detail_Action(HttpServletRequest req, Model model);
	
	public void pd_Update_Action(MultipartHttpServletRequest req, Model model);
	
	public void pd_Delete_Action(HttpServletRequest req, Model model);
//	
//	public void pd_increase(HttpServletRequest req , Model model);
//	
//	public void pd_decrease(HttpServletRequest req, Model model);
	
//	public void pd_Chart_Action(HttpServletRequest req, Model model);
	

}
