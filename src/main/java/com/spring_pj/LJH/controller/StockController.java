package com.spring_pj.LJH.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring_pj.LJH.dao.ProductDAO;
import com.spring_pj.LJH.dto.ConfrimOrderDTO;
import com.spring_pj.LJH.service.ProductService;


@Controller
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);

	@Autowired
	ProductDAO dao;
	
	@Autowired
	ProductService service;
	
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("productList.st")
	public String productList(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [productList]");
		
		service.pd_List(req, model);
		
		return "manager/stock/productList";
	}
	
	@RequestMapping("productAdd.st")
	public String productAdd(HttpServletRequest req, Model model ) {
		logger.info("[URL Controller] - > [productAdd] ");
		
		return "manager/stock/productAdd";
	}
	
	@RequestMapping("productAddAction.st")
	public String productAddAction(MultipartHttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [productAddAction] ");
		
		service.pd_Insert_Action(req, model);
		
		return "manager/stock/productAddAction";
	}
	
	@RequestMapping("productDetail.st")
	public String productDetail(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [productDetail] ");
		
		service.pd_Detail_Action(req, model);
		
		return "manager/stock/productDetail";
	}
	
	@RequestMapping("productUpdateAction.st")
	public String productUpdateAction(MultipartHttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [productUpdateAction] ");
		
		service.pd_Update_Action(req, model);
		
		return "manager/stock/productUpdateAction";
	}
	
	@RequestMapping("productDeleteAction.st")
	public String productDeleteAction(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [productDeleteAction] ");
		
		service.pd_Delete_Action(req, model);
				
		return "manager/stock/productDeleteAction";
	}
	
	@RequestMapping("best.st")
	public String best(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [best] ");
		
		service.pd_List(req, model);
		
		return "customer/customer_Product/best";
	}
	
	@RequestMapping("product_Detail.st")
	public String product_Detail(HttpServletRequest req, Model model) {
		logger.info("[URL Controller] - > [product_Detail] ");
		
		service.pd_Detail_Action(req, model);
		
		return "customer/customer_Product/product_Detail";
	}
	
	@RequestMapping("chartAction.st") 
	public String chart_Action(HttpServletRequest req, Model model) { 
	logger.info("[URL Controller] - > [chart_Action] ");
	
	model.addAttribute("list", getString(dao.product_Account()));
	model.addAttribute("category", getArray(dao.product_Account_category()));
	
	return "manager/account/googleChart"; 
	  
	}
	//day 결산 parsing
	public String getString(List<ConfrimOrderDTO> list) {
		String str = "[";
		str += "['제품구매일', '합산금액'],";
		
		for(ConfrimOrderDTO dto : list ) {
			str += "['" + dto.getD_date() + "'," + dto.getConfirm_price() + "],";
		}					     
		
		str = str.substring(0, str.length()-1);
		str += "]";
		
		System.out.println(str);
		
		return  str;
	}
	//제품 카테고리 결산 parsing
	public String getArray(List<ConfrimOrderDTO> list) {
		String str = "[";
		str += "['카테고리별', '판매수량'],";
		
		for(ConfrimOrderDTO dto : list ) {
			str += "['" + dto.getCategory() + "'," + dto.getConfirm_count() + "],";
		}
		
		str = str.substring(0, str.length()-1);
		str += "]";
		
		System.out.println(str);
		
		return  str;
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("chart.st") public void chart_json(HttpServletRequest req,
	 * HttpServletResponse res, Model model) throws JsonIOException, IOException {
	 * logger.info("[URL Controller] - > [chart_Action] ");
	 * 
	 * List<ConfrimOrderDTO> list = dao.product_Account();
	 * 
	 * res.setContentType("application/json; chartset=UTF-8"); Gson gson = new
	 * Gson(); String jsondata = gson.toJson(list); gson.toJson(list,
	 * res.getWriter());
	 * 
	 * }
	 */
	
}
