package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entity.Food;
import com.example.entity.Reply;
import com.example.repository.FoodRepository;
import com.example.repository.ReplyRepository;



@Controller
@RequestMapping(value = "/")
public class FoodController {

	@Autowired
	private FoodRepository fRepository;

	@Autowired
	private ReplyRepository rRepository;
	

	// 맛집 메인 화면
	@RequestMapping(value = "/food")
	public String foodGET(Model model) {

		List<Food> list = fRepository.findAll();
		model.addAttribute("list", list);

		return "Food/Food";
	}

	// 지역별 맛집 list
	@RequestMapping(value = "food_region") 
	public String foodregionGET(Model model, @RequestParam(value = "region") String region) {

		List<Food> list1 = fRepository.findByRegion(region);
		model.addAttribute("list1", list1);

		return "Food/FoodRegion";
	}

	// 메뉴별 맛집 list
	@RequestMapping(value = "/food_menu") 
	public String foodmenuGET(Model model, @RequestParam(value = "tag") String tag) {

		List<Food> taglist = fRepository.findByMenuIgnoreCaseContaining(tag);
		model.addAttribute("taglist", taglist);
		model.addAttribute("tag", tag);

		return "Food/FoodMenu";
	}
	
	// 맛집 리스트 상세화면
	@RequestMapping(value = "/food_details")
	public String fooddetailGET(Model model, @RequestParam(value = "name") String name) {
		
		// foodlist
		Food foodlist = fRepository.findByName(name);
		model.addAttribute("foodlist", foodlist);
		
		
		// 댓글
		List<Reply> replyList = rRepository.findByNameOrderByCreatedDateDesc(name);
		int cntReply = rRepository.countByName(name);

		model.addAttribute("replyList", replyList);
		model.addAttribute("cntReply", cntReply);
		
		return "Food/Food_details";
	}

	@RequestMapping(value = "/food_details", method = RequestMethod.POST)
	public String fooddetailPOST(
			@RequestParam(value = "reply") String reply, 
			Authentication auth,
			HttpServletResponse response,
			@RequestParam(value = "name", defaultValue = "", required = false) String name) throws IOException {
		String str = "<script>alert('로그인 후 이용해주세요.'); location.href='http://127.0.0.1:9099/ROOT/food_details?name="+  URLEncoder.encode(name,"UTF-8") +"'</script>";
	
		try {
			User user = (User) auth.getPrincipal();
			if (user != null) {
				String id = user.getUsername();
	
				// 저장할 댓글에 필요한건 로그인된 userid, 게시글 name, 댓글 reply 정보.
				Reply vo = new Reply();
				vo.setUserid(id);
				vo.setName(name);
				vo.setReply(reply);
				rRepository.save(vo);
			}
		}
		catch(Exception e) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(str);
			out.flush();
		}
		return "redirect:/food_details?name=" + URLEncoder.encode(name, "UTF-8");
	}



}
