package com.spring_pj.LJH.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mysql.cj.xdevapi.JsonArray;
import com.spring_pj.LJH.dao.ProductDAO;
import com.spring_pj.LJH.dto.ConfrimOrderDTO;
import com.spring_pj.LJH.dto.ProductDTO;

import page.Paging;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO dao;
	
	@Autowired
	ProductDTO dto;
	
	@Override
	public void pd_List(HttpServletRequest req, Model model) {
		System.out.println(" service - pd_List");
		
		String pageNum = req.getParameter("pageNum");
		//4단계
		//5-1단계
		Paging page = new Paging(pageNum);
		int total = dao.product_Count();
		//페이지 카운트
		page.setTotalCount(total);
		//페이지 별 시작번호
		int start = page.getStartRow();
		//페이지 별 끝 번호
		int end = page.getEndRow();
		//5-2단계
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<ProductDTO> list = dao.product_List(map);
		//6단계
		model.addAttribute("list", list);
		model.addAttribute("paging", page);
	}
	
	@Override
	public void pd_Insert_Action(MultipartHttpServletRequest req, Model model) {
		System.out.println(" service - pd_Insert");
		
		//이미지 업로더 추가
		MultipartFile file = req.getFile("Img");
		System.out.println("file : " + file);
		
		//저장경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		
		//저장경로(배포디렉터리)
		String realDir = "C:\\Users\\LJH_Note\\eclipse-workspace\\spring_pj_LJH\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
		
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));
			
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			
		//3단계 화면에서 값을 입력받는다.
		ProductDTO dto = new ProductDTO();
		//플젝명 해당경로
		String p_img1 = "/LJH/resources/upload/" + file.getOriginalFilename();
		System.out.println("dto.getImg() : " + p_img1);
		
		dto.setBrand(req.getParameter("brand")); 
		dto.setName(req.getParameter("name"));
		dto.setImg(p_img1);
		dto.setContent(req.getParameter("content"));
		dto.setCategory(req.getParameter("category"));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setCount(Integer.parseInt(req.getParameter("count")));
		dto.setStatus(req.getParameter("status"));
		//4단계 싱글톤 방식으로 DAO 생성 다형성적용
		//5단계 상품정보 Insert
		int insertCnt = dao.product_Insert(dto);
		System.out.println("dto: " + dto);
		//6단계 setAttribute 전송
		model.addAttribute("insertCnt", insertCnt);
		
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void pd_Detail_Action(HttpServletRequest req, Model model) {
		System.out.println(" service - pd_Detail_Action");		
		
		//3단계 화면에서 값을 받는다.
		int pdNo = Integer.parseInt(req.getParameter("no"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
	
		//4단계 싱글톤방식으로 DAO 생성
		ProductDTO dto = new ProductDTO();
		
		//5-1단계 상세페이지
		dto = dao.product_Detail(pdNo);
		System.out.println("서비스 dto : " + dto);
		
		//6단계 jsp전달
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		
	}

	@Override
	public void pd_Update_Action(MultipartHttpServletRequest req, Model model) {
		System.out.println("service - pd_Update_Action");		
		
		int hiddenPdNo = Integer.parseInt(req.getParameter("hiddenpdNo"));
		String hiddenPdImg = req.getParameter("hiddenpdImg");	//기존 상품이미지
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int updateCnt = 0; 
		
		//이미지 업로더 추가
		MultipartFile file = req.getFile("Img");
		System.out.println("file : " + file);
		
		//저장경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		
		//저장경로(배포디렉터리)
		String realDir = "C:\\Users\\LJH_Note\\eclipse-workspace\\spring_pj_LJH\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
		
		String p_img1 = "";
		//새로운 이미지를 사용할경우 p_img에 등록
		if(file.getOriginalFilename() != null && file.getOriginalFilename() !="") {
			try {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));
				//선택한 파일 이름을 디렉토리 뒤에 붙여서 가지고 온다.
				FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
				FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				fis.close();
				fos.close();
			} catch (IOException e ) {
				e.printStackTrace();
			}
			p_img1 = "/LJH/resources/upload/" + file.getOriginalFilename();
			System.out.println("새 이미지 getImg() : " + p_img1);
		} else {
			//기존 이미지 사용
			p_img1 = hiddenPdImg;
			System.out.println("기존 getImg() : " + p_img1);
		}
		
		//3단계 화면에서 값을 입력받는다.
		ProductDTO dto = new ProductDTO();
		
		dto.setNo(hiddenPdNo);
		dto.setImg(p_img1);
		dto.setName(req.getParameter("name"));
		dto.setCategory(req.getParameter("category"));
		dto.setContent(req.getParameter("content"));
		dto.setBrand(req.getParameter("brand"));
		dto.setPrice(Integer.parseInt(req.getParameter("price")));
		dto.setCount(Integer.parseInt(req.getParameter("count")));
		dto.setStatus(req.getParameter("status"));
		//5단계 상품정보 수정
		updateCnt =  dao.product_Update(dto);
		//6단계 jsp 전달
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("pageNum", pageNum);
		
	}
	
	@Override
	public void pd_Delete_Action(HttpServletRequest req, Model model) {
		System.out.println("service - pd_Delete_Action");		
		
		int no = Integer.parseInt(req.getParameter("no"));
		String pageNum = req.getParameter("pageNum");
		
		int deleteCnt = dao.product_Delete(no);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("deleteCnt", deleteCnt);
	}

	/*
	 * @Override public void pd_Chart_Action(HttpServletRequest req, Model model) {
	 * System.out.println("service - pd_Chart_Action");
	 * 
	 * }
	 */

//	@Override
//	public void pd_increase(HttpServletRequest req, Model model) {
//		System.out.println(" service - pd_increase");		
//		
//		int count = Integer.parseInt(req.getParameter("order_count"));
//		int id = Integer.parseInt(req.getParameter("pd_no"));
//		
//		System.out.println("count : " + count);
//		System.out.println("id : " + id);
//		
//		dao.count_Increase(count, id);
//		
//	}
//
//	@Override
//	public void pd_decrease(HttpServletRequest req, Model model) {
//		System.out.println(" service - pd_decrease");	
//		
//		int count = Integer.parseInt(req.getParameter("order_count"));
//		int id = Integer.parseInt(req.getParameter("pd_no"));
//		
//		System.out.println("count : " + count);
//		System.out.println("id : " + id);
//		
//		dao.count_decrease(count, id);
//	}
	
}
