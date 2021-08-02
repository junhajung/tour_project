package com.example.entity;

import java.util.Date;

import javax.persistence.ManyToOne;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

@Document(collection = "Reply")
public class Reply {
	
	@Id
	private String id;
	
	private String reply;
	
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Date createdDate = new Date();
	
	private String userid;
	
	@ManyToOne
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate2) {
		this.createdDate = createdDate;
	}
	
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Reply [id=" + id + ", reply=" + reply + ", createdDate=" + createdDate + ", userid=" + userid
				+ ", name=" + name + "]";
	}
	
	
}