package com.example.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entity.Food;
import com.example.entity.Tour;
import com.example.entity.Stay;
import com.example.entity.TOP8;
import com.example.entity.Activity;
import com.example.repository.ActivityRepository;
import com.example.repository.InstaRepository;
import com.example.repository.FoodRepository;
import com.example.repository.ReplyRepository;
import com.example.repository.Top8Repository;
import com.example.repository.TourRepository;
import com.example.repository.StayRepository;

@Controller
@RequestMapping(value="/")
public class HomeController {
	
	@Autowired
	private TourRepository tRepository;
	
	@Autowired
	private FoodRepository fRepository;
	
	@Autowired
	private StayRepository sRepository;
	
	@Autowired
	private ActivityRepository aRepository;
	
	@Autowired
	private Top8Repository topRepository;


	@RequestMapping(value={"/main","","/home"})
	public String mainGet(Authentication auth, Model model) {

		return "home";
	}
	
	@RequestMapping(value="/search")
	public String searchGET(Model model, 
			@RequestParam(value="text") String text,
			@RequestParam(value="type") String type) {
		if(type.equals("all")) {
			
			List<Stay> list = sRepository.findAllByNameIgnoreCaseContaining(text);
			List<Food> list1 = fRepository.findAllByNameIgnoreCaseContaining(text);
			List<Tour> list2 = tRepository.findAllByNameIgnoreCaseContaining(text);
			
			model.addAttribute("list1", list1);
			model.addAttribute("list2", list2);
			model.addAttribute("list", list);
			
		}
		if(type.equals("place")) {
			List<Stay> list = sRepository.findAllByNameIgnoreCaseContaining(text);
			model.addAttribute("list", list);
			model.addAttribute("image", "stay_image");
		}
		if(type.equals("eat")) {
			 List<Food> list1 = fRepository.findAllByNameIgnoreCaseContaining(text);
			 model.addAttribute("list1", list1);
			 model.addAttribute("image", "food_image");
		}
		if(type.equals("tour")) {
			List<Tour> list2 = tRepository.findAllByNameIgnoreCaseContaining(text);
			model.addAttribute("list2", list2);
			model.addAttribute("image", "tour_image");
		}
		model.addAttribute("type", type);
		model.addAttribute("text", text);

		return "search";
	}
	

	@RequestMapping(value="/activity")
	public String activityGET(Model model) {
		List<Activity> list = aRepository.findAll();
		model.addAttribute("list", list);
		
		return "activity";
	}


	@RequestMapping(value = "/main_weather", method = RequestMethod.GET)
	public String main_weatherGET() {
		return "main_weather";
	}
	
	
	
	
//	@RequestMapping(value="/image_insert")
//	public String image_insert() {
//		List<TOP8> list = topRepository.findAll();
//		List<Tour> list1 = tRepository.findAll();
//		
//		int i = 0;
//		int j = 0;
//		while(i < list1.size() - 1) {
//			byte[] image = list1.get(i).getImage();
//			String name = list.get(j).getName();
//			String name1 = list1.get(i).getName();
//			System.out.println(name);
//			System.out.println(name1);
//			if(name.equals(name1)) {
//				System.out.println(name);
//				System.out.println(name1);
//				System.out.println("=========================================");
//				TOP8 list2 = topRepository.findByName(name);
//				list2.setImage(image);
//				topRepository.save(list2);
//				System.out.println(i);
//				if(j >= 9){
//					break;
//				}
//				else {
//					i = 0;
//					j++;
//				}
//			}
//			else{
//				i++;
//			}
//			
//		}
//		return "home";
//	}
	
//	@RequestMapping(value="/tag_insert")
//	public String tag_insert() {
//		List<TOP8> list = topRepository.findAll();
//		List<Tour> list1 = tRepository.findAll();
//		
//		int i = 0;
//		int j = 1;
//		while(i < list1.size() - 1) {
//			String tag = list1.get(i).getTag();
//			String name = list.get(j).getName();
//			String name1 = list1.get(i).getName();
//			if(name1.equals(name)) {
//				System.out.println(name);
//				System.out.println(name1);
//				System.out.println("=========================================");
//				TOP8 list2 = topRepository.findByName(name);
//				list2.setTag(tag);
//				topRepository.save(list2);
//				if(j >= 8){
//					break;
//				}
//				else {
//					i = 0;
//					j++;
//				}
//			}
//			else{
//				i++;
//			}
//			
//		}
//		return "home";
//	}


	
}
