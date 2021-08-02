package com.example.entity;

import java.util.Date;

import javax.persistence.OneToMany;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import com.sun.istack.NotNull;

@Document(collection = "User")
public class MyUsers{
	
	@Id
	private String userid;

	@NotNull
	private String userpw;
	
	private String email;
	
	private String username;
	
	private String phone;
	
	private String userauth;
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date createdDate = new Date();

	@OneToMany
	private String reply;
	
	// 댓글 구현
	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUserauth() {
		return userauth;
	}

	public void setUserauth(String userauth) {
		this.userauth = userauth;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "MyUsers [userid=" + userid + ", userpw=" + userpw + ", email=" + email + ", username=" + username
				+ ", phone=" + phone + ", userauth=" + userauth + ", createdDate=" + createdDate + ", reply=" + reply
				+ ", getReply()=" + getReply() + ", getUserid()=" + getUserid() + ", getUserpw()=" + getUserpw()
				+ ", getEmail()=" + getEmail() + ", getUsername()=" + getUsername() + ", getPhone()=" + getPhone()
				+ ", getUserauth()=" + getUserauth() + ", getCreatedDate()=" + getCreatedDate() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
