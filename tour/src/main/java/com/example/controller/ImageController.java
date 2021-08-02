package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entity.Food;
import com.example.entity.Stay;
import com.example.entity.Tour;
import com.example.entity.Naver_guide;
import com.example.entity.Activity;
import com.example.repository.ActivityRepository;
import com.example.repository.FoodRepository;
import com.example.repository.NaverGuideRepository;
import com.example.repository.TourRepository;
import com.example.repository.StayRepository;

@Controller
@RequestMapping(value="/")
public class ImageController {
	
	@Autowired
	private TourRepository tRepository;
	
	@Autowired
	private FoodRepository fRepository;
	
	@Autowired
	private StayRepository sRepository;
	
	@Autowired
	private ActivityRepository aRepository;
	
	@Autowired
	private NaverGuideRepository nRespository;
	
	
	
	@RequestMapping(value="/stay_image")
	public ResponseEntity<byte[]> stay_imageGET(@RequestParam("name") String name, HttpServletRequest request) {
		try {
			Stay vo = sRepository.findByName(name);
			byte[] img = vo.getImage();
			if(img.length>0) {
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				return new ResponseEntity<byte[]>(img, header, HttpStatus.OK);
			}
			return null;
		}
		catch (Exception e) {
			return null;
		}
	}
	
	
	@RequestMapping(value="/tour_image")
	public ResponseEntity<byte[]> tour_imageGET(@RequestParam("name") String name, HttpServletRequest request){
		try {
			Tour vo = tRepository.findByName(name);
			byte[] img = vo.getImage();
			if(img.length > 0) {
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				return new ResponseEntity<byte[]>(img, header, HttpStatus.OK);
			}
			return null;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	
	@RequestMapping(value="/activity_image")
	public ResponseEntity<byte[]> activity_imageGET(@RequestParam("name") String name, HttpServletRequest request){
		try {
			Activity vo = aRepository.findByName(name);
			byte[] img = vo.getImage();
			if(img.length > 0) {
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				return new ResponseEntity<byte[]>(img, header, HttpStatus.OK);
			}
			return null;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	@RequestMapping(value = "/food_image")
	public ResponseEntity<byte[]> food_imageGET(@RequestParam("name") String name, HttpServletRequest request) {
		try {
			Food vo = fRepository.findByName(name);
			byte[] img = vo.getImage();
			if (img.length > 0) {
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				return new ResponseEntity<byte[]>(img, header, HttpStatus.OK);
			}
			return null;
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping(value="/naver_image")
	public ResponseEntity<byte[]> naver_imageGET(@RequestParam("title") String title, HttpServletRequest request){
		try {
			Naver_guide vo = nRespository.findByTitle(title);
			byte[] img = vo.getImage();
			if(img.length > 0) {
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				return new ResponseEntity<byte[]>(img, header, HttpStatus.OK);
			}
			return null;
		}
		catch(Exception e) {
			return null;
		}
	}

}
