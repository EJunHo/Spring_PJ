package com.spring_pj.LJH.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class boardDTO {
	private int num;
	private String title;
	private String content;
	private String writer;
	private String password;
	private int redCnt;
	private Date indate;
	private int comment_count;
	
	
	public boardDTO() {
		
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRedCnt() {
		return redCnt;
	}
	public void setRedCnt(int redCnt) {
		this.redCnt = redCnt;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
  
}
