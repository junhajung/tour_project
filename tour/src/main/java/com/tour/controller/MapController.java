package com.example.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.entity.MyMap;
import com.example.entity.Naver_guide;
import com.example.repository.FoodRepository;
import com.example.repository.MapRepository;
import com.example.repository.NaverGuideRepository;
import com.example.repository.TourRepository;
import com.example.repository.StayRepository;

@Controller
@RequestMapping(value="/")
public class MapController {
	
	@Autowired
	private MapRepository mapRepository;
	
	@Autowired
	private MongoTemplate mTemplate;
	
	@Autowired
	private StayRepository sRepository;
	
	@Autowired
	private TourRepository tRepository;

	@Autowired
	private NaverGuideRepository nRespository;
	
	// Mymap
	// python에서 내 지도 추가하기 버튼 클릭시 내용 get
	@RequestMapping(value="/python_get")
	public String Map(Model model)  {
		return "Map/python_get";
	}
	
	// mymap list 출력
	@RequestMapping(value="/mymap")
	public String mymapGET(Principal principal, Model model)  {
		String userid = principal.getName();
		List<MyMap> list = mapRepository.findByUserid(userid);
		model.addAttribute("list", list);
		
		return "Map/mymap";	
	}
	
	// mymap 수정
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String update(Principal principal,
			@ModelAttribute MyMap map,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "memo") String memo)  {
		String userid = principal.getName();
		
		Query query = new Query(new Criteria("userid").is(userid).and("name").is(name));
		Update update = new Update();
		update.set("title", title);
		update.set("memo", memo);
		mTemplate.upsert(query, update, map.getClass());
		
		return "redirect:/mymap";
	}
	
	// mymap 삭제
	@RequestMapping(value = "/delete")
	public String delete(Principal principal, @RequestParam(value = "name") String name) {
		String userid = principal.getName();
		mapRepository.deleteByNameAndUserid(name, userid);
		
		return "redirect:/mymap";
	}
	
	// 이미 추가한 내용일 시 alert 출력
	@RequestMapping(value="/map_failed")
	public String map_failed(Model model)  {
		return "Map/map_failed";
	}
	
	// 로그인 안되어 있을 시 alert 출력
	@RequestMapping(value="/login_alert")
	public String alert(Model model)  {
		return "Map/login_alert";
	}
	
	@RequestMapping(value="/mymap_detail")
	public String mymap_detail(Model model, @RequestParam(value = "name") String name) throws UnsupportedEncodingException  {
		
		name = name.replace(" ", " ");
		if(sRepository.findByName(name) != null) {
			return "redirect:/stay_details?name=" + URLEncoder.encode(name, "UTF-8").replace("%E2%80%80", "%20");
		}
		else if(tRepository.findByName(name) != null) {
			return "redirect:/tour_details?name=" +  URLEncoder.encode(name, "UTF-8").replace("%E2%80%80", "%20");
		}
		else {
			return "redirect:/food_details?name=" + URLEncoder.encode(name, "UTF-8").replace("%E2%80%80", "%20");
		}
	}
	
	@RequestMapping(value="/insert_map")
	public String insert_map(Model model, Principal principal,
			@ModelAttribute MyMap vo,
			@RequestParam(value = "lng") String lng,
			@RequestParam(value = "lat") String lat,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "title") String title,
			@RequestParam(value = "memo") String memo,
			@RequestParam(value = "addr") String addr)  {
		
		String map_name = "";
		Double lng1 = Double.parseDouble(lng);
		Double lat1 = Double.parseDouble(lat);
		try {
			String userid = principal.getName();
			model.addAttribute("userid",userid);
			
			List<MyMap> a = mapRepository.findAllByNameAndUserid(name, userid);
			
			int j = a.size();
			for(int i = 0; i <= j - 1; i++)
				map_name = a.get(i).getName();
			
			if(map_name.equals(name)) {
				return "Map/map_failed";	
			}
			else {
				vo.setLat(lng1); 
				vo.setLng(lat1);
				vo.setUserid(userid);
				vo.setAddr(addr);
				if(memo == null ) {
					vo.setMemo(" ");
				}
				if(title == null) {
					vo.setTitle(" ");
				}
				if(memo != null && title != null) {
					vo.setMemo(memo);
					vo.setTitle(title);
				}
				mapRepository.save(vo);
				model.addAttribute("list", vo);
				
				return "Map/insert_map";	
			}
		} 
		catch(Exception e){
			return "Map/login_alert";
		}
	}
	
	
	@RequestMapping(value = "/ActivityMap", method = RequestMethod.GET)
	public String ActivityMapGET() {
		return "Map/ActivityMap";
	}
	
	
	@RequestMapping(value="/tourmap")
	public String tourmapGET(Model model) {
		List<Naver_guide> list = nRespository.findAll();
		model.addAttribute("list", list);
				
		return "Map/tourmap";
	}
	
	@RequestMapping(value = "/chungnam", method = RequestMethod.GET)
	public String mapGET() {
		return "Map/chungnam";
	}

	
	
	// tourmap 구글지도.ver
//	@RequestMapping(value="/tourmap2")
//	public String tourmap2GET(Model model) {
//		List<네이버여행가이드> list = nRespository.findAll();
//		List<Tour> list2 = tRepository.findAll();
//		List<Stay> list3 = sRepository.findAll();
//		List<Food> list4 = fRepository.findAll();
//		model.addAttribute("list", list);
//		model.addAttribute("list2", list2);
//		model.addAttribute("list3", list3);
//		model.addAttribute("list4", list4);
//				
//		return "tourmap2";
//	}

}
