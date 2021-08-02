package com.example.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "Stay")
public class Stay {
	@Id
	private String id;

	@Field(name = "region")
	private String region;

	@Field(name = "kate")
	private String kate;

	@Field(name = "name")
	private String name;
	
	
	@Field(name = "addr")
	private String addr;

	@Field(name = "lat")
	private Double lat;

	@Field(name = "lng")
	private Double lng;
	
	@Field(name = "info") // 객실정보
	private String info;
	
	@Field(name = "content")
	private String content;
	
	@Field(name = "image")
	private byte[] image;

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

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Double getLat() {
		return lat;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
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
