package com.example.entity;



import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "Food")
public class Food {
	
	@Id
	private String id;
		
	@Field(name = "region")
	private String region;
	
	@Field(name = "kate")
	private String kate;
	
	@Field(name = "name")
	private String name;
	
	@Field(name = "menu")
	private String menu;
	
	@Field(name = "addr")
	private String addr;
	
	@Field(name = "phone")
	private String phone;
	
	@Field(name = "lat")
	private String lat;
	
	@Field(name = "lng")
	private String lng;
	
	@Field(name = "content")
	private String content;
	
	@Field(name = "image")
	private byte[] image;
	
	
	public Food() {
		super();
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getRegion() {
		return region;
	}


	public void setRegion(String region) {
		this.region = region;
	}


	public String getKate() {
		return kate;
	}


	public void setKate(String kate) {
		this.kate = kate;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getMenu() {
		return menu;
	}


	public void setMenu(String menu) {
		this.menu = menu;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getLat() {
		return lat;
	}


	public void setLat(String lat) {
		this.lat = lat;
	}


	public String getLng() {
		return lng;
	}


	public void setLng(String lng) {
		this.lng = lng;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public byte[] getImage() {
		return image;
	}


	public void setImage(byte[] image) {
		this.image = image;
	}
	

}
