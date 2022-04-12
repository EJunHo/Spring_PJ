package com.spring_pj.LJH.dto;
//구매 상품에 대한 정보 DTO
public class PurchaseDTO {
	private int purchase_no;
	private String confirm_name; 
	private int confirm_price;
	private int confirm_count;
	
	public int getPurchase_no() {
		return purchase_no;
	}
	public void setPurchase_no(int purchase_no) {
		this.purchase_no = purchase_no;
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
	
	@Override
	public String toString() {
		return "PurchaseDTO [purchase_no=" + purchase_no + ", confirm_name=" + confirm_name + ", confirm_price="
				+ confirm_price + ", confirm_count=" + confirm_count + ", getPurchase_no()=" + getPurchase_no()
				+ ", getConfirm_name()=" + getConfirm_name() + ", getConfirm_price()=" + getConfirm_price()
				+ ", getConfirm_count()=" + getConfirm_count() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	public PurchaseDTO() {
	}
	
}
