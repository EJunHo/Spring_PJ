package com.spring_pj.LJH.dto;

import java.sql.Date;


//개인 장바구니 dto

public class ProductCartDTO {
	private int order_no; 		//주문번호 1씩증가하도록 
	private int order_id;	    //제품번호 fk_no = product_no와 같다
	private String user_id;		//제품 주문자 user_id = member id와 같다 
	private String order_name;  //제품명
	private String order_img;   //제품이미지
	private int order_price;    //제품가격
	private int order_count; 	//제품수량
	private Date order_date;    //구매날짜
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_img() {
		return order_img;
	}
	public void setOrder_img(String order_img) {
		this.order_img = order_img;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "ProductCartDTO [order_no=" + order_no + ", order_id=" + order_id + ", user_id=" + user_id
				+ ", order_name=" + order_name + ", order_img=" + order_img + ", order_price=" + order_price
				+ ", order_count=" + order_count + ", order_date=" + order_date + "]";
	}
	

	
	
	
	
}
