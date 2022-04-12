package com.spring_pj.LJH.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private Date birthday;
	private String address;
	private String hp;
	private String email;
	private Timestamp regdate;
	private String key;			//이메일 인증
	private String authority;	//권한 설정시 사용
	private String enabled;		//계정의 사용여부(이메일은징 여부에 따라 true, false)
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public MemberDTO () { 
		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public MemberDTO(String id, String password, String name, Date birthday, String address, String hp, String email,
			Timestamp regdate) {
		
		this.id = id;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.address = address;
		this.hp = hp;
		this.email = email;
		this.regdate = regdate;
		
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", password=" + password + ", name=" + name + ", birthday=" + birthday
				+ ", address=" + address + ", hp=" + hp + ", email=" + email + ", regdate=" + regdate + ", key=" + key
				+ ", authority=" + authority + ", enabled=" + enabled + "]";
	}
}
