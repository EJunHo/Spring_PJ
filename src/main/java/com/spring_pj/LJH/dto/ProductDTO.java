package com.spring_pj.LJH.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;
//제품리스트 DTO
@Repository
public class ProductDTO {
	
	private int no;
	private String name;
	private String Img;
	private String category;
	private String brand;
	private String content;
	private int price;
	private int count;
	private String status;
	private Date indate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return Img;
	}
	public void setImg(String img) {
		Img = img;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "ProductDTO [no=" + no + ", name=" + name + ", Img=" + Img + ", category=" + category + ", brand="
				+ brand + ", content=" + content + ", price=" + price + ", count=" + count + ", status=" + status
				+ ", indate=" + indate + "]";
	}

}
