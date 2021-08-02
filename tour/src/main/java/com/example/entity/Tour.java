package com.example.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "Tour") // mongodb에 생성될 collection이름
public class Tour {
	@Id
	private String id;

	@Field(name = "region")
	private String region;

	@Field(name = "kate")
	private String kate;

	@Field(name = "tag")
	private String tag;

	@Field(name = "name")
	private String name;

	@Field(name = "addr")
	private String addr;

	@Field(name = "lat")
	private Double lat;

	@Field(name = "lng")
	private Double lng;

	@Field(name = "subtitle")
	private String subtitle;

	@Field(name = "others")
	private String others;

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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
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

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
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
