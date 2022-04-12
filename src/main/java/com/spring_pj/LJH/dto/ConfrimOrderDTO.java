package com.spring_pj.LJH.dto;

import java.sql.Date;

public class ConfrimOrderDTO {
	
	private int confirm_no;
	private int delivery_no;
	private int pd_no;
	private String confirm_id;
	private String confirm_name;
	private int confirm_price;
	private int confirm_count;
	private String confirm_address;
	private Date confirm_date;
	private String confirm_state;
	private String confirm_phone;
	private String confirm_email;
	private String category;
	private int d_date;
	
	public String getCategory() {
		return category;
	}
	
	
	public int getD_date() {
		return d_date;
	}


	public void setD_date(int d_date) {
		this.d_date = d_date;
	}


	public void setCategory(String category) {
		this.category = category;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public String getConfirm_phone() {
		return confirm_phone;
	}
	public void setConfirm_phone(String confirm_phone) {
		this.confirm_phone = confirm_phone;
	}
	public String getConfirm_email() {
		return confirm_email;
	}
	public void setConfirm_email(String confirm_email) {
		this.confirm_email = confirm_email;
	}
	public int getConfirm_no() {
		return confirm_no;
	}
	public void setConfirm_no(int confirm_no) {
		this.confirm_no = confirm_no;
	}
	public int getDelivery_no() {
		return delivery_no;
	}
	public void setDelivery_no(int delivery_no) {
		this.delivery_no = delivery_no;
	}
	public String getConfirm_id() {
		return confirm_id;
	}
	public void setConfirm_id(String confirm_id) {
		this.confirm_id = confirm_id;
	}
	public String getConfirm_name() {
		return confirm_name;
	}
	public void setConfirm_name(String confirm_name) {
		this.confirm_name = confirm_name;
	}
	public int getConfirm_price() {
		return confirm_price;
	}
	public void setConfirm_price(int confirm_price) {
		this.confirm_price = confirm_price;
	}
	public int getConfirm_count() {
		return confirm_count;
	}
	public void setConfirm_count(int confirm_count) {
		this.confirm_count = confirm_count;
	}
	public Date getConfirm_date() {
		return confirm_date;
	}
	public void setConfirm_date(Date confirm_date) {
		this.confirm_date = confirm_date;
	}
	public String getConfirm_state() {
		return confirm_state;
	}
	public void setConfirm_state(String confirm_state) {
		this.confirm_state = confirm_state;
	}
	public String getConfirm_address() {
		return confirm_address;
	}
	public void setConfirm_address(String confirm_address) {
		this.confirm_address = confirm_address;
	}
	@Override
	public String toString() {
		return "ConfrimOrderDTO [confirm_no=" + confirm_no + ", delivery_no=" + delivery_no + ", pd_no=" + pd_no
				+ ", confirm_id=" + confirm_id + ", confirm_name=" + confirm_name + ", confirm_price=" + confirm_price
				+ ", confirm_count=" + confirm_count + ", confirm_address=" + confirm_address + ", confirm_date="
				+ confirm_date + ", confirm_state=" + confirm_state + ", confirm_phone=" + confirm_phone
				+ ", confirm_email=" + confirm_email + ", category=" + category + "]";
	}
	
	
	
}
