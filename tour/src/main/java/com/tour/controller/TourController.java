package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entity.Instagram;
import com.example.entity.Reply;
import com.example.entity.TOP8;
import com.example.entity.Tour;
import com.example.repository.InstaRepository;
import com.example.repository.ReplyRepository;
import com.example.repository.Top8Repository;
import com.example.repository.TourRepository;
import org.springframework.data.domain.Sort;

@Controller
@RequestMapping(value="/")
public class TourController {
	
	@Autowired
	private TourRepository tRepository;
	
	@Autowired
	private Top8Repository topRepository;
	
	@Autowired
	private InstaRepository iRepository;
	
	@Autowired
	private ReplyRepository rRepository;
	
	
	
	// 인기관광지 TOP8 list
	@RequestMapping(value="/popular", method=RequestMethod.GET)
	public String blogGET(Model model) {

		List<TOP8> list = topRepository.findAll();
		model.addAttribute("list", list);
		
		List<Tour> tourlist = tRepository.findAll();
		model.addAttribute("tourlist", tourlist);
		
		return "Tour/popular";
	}

	// instagram 지역별 1~3위 list
	@RequestMapping(value="/instagram", method=RequestMethod.GET)
	public String blog2GET(Model model) {

		List<Instagram> instagram = iRepository.findAll();
		model.addAttribute("instagram", instagram);

		return "Tour/instagram";
	}

	@RequestMapping(value="/tour_details")
	public String blog_detailsGET(Model model, @RequestParam(value="name") String name) throws UnsupportedEncodingException {
		TOP8 vo = topRepository.findByName(name);
		model.addAttribute("vo", vo);
		
		Tour vo1 = tRepository.findByName(name); 
		model.addAttribute("vo1", vo1);
		
		List<Tour> state = tRepository.findAll(); 
		model.addAttribute("state", state);
		
		
		List<Reply> replylist = rRepository.findByNameOrderByCreatedDateDesc(name);
		int cntReply = rRepository.countByName(name);
		
		model.addAttribute("replylist", replylist);
		model.addAttribute("cntReply", cntReply);
		
		return "Tour/tour_details";
	}


	@RequestMapping(value="/tour_details", method = RequestMethod.POST)
	public String blog_detailsPOST(
			@RequestParam(value="reply") String reply,
			Authentication auth,
			HttpServletResponse response,
			@RequestParam(value = "name", defaultValue = "", required = false) String name) throws IOException {
		String str = "<script>alert('로그인 후 이용해주세요.'); location.href='http://127.0.0.1:9099/ROOT/tour_details?name="+  URLEncoder.encode(name,"UTF-8") +"'</script>";
		try {
			User user = (User) auth.getPrincipal();
			if(user!=null) {
				String id = user.getUsername();
				
				// 저장할 댓글에 필요한건 로그인된 userid, 게시글 name, 댓글 reply 정보.
				Reply vo = new Reply();
				vo.setUserid(id);
				vo.setName(name);
				vo.setReply(reply);
				
				rRepository.save(vo);
				vo.toString();
			}
		}
		catch(Exception e) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(str);
			out.flush();
		}

		return "redirect:/tour_details?name="+ URLEncoder.encode(name,"UTF-8");
	}
	
	@RequestMapping(value="/tour_region")
	public String tour_regionGET(Model model, @RequestParam(value="region") String region) {
		
		List<Tour> vo1 = tRepository.findByRegion(region); 
		model.addAttribute("vo1", vo1);
		
		return "Tour/tour_region";
	}

	
	@RequestMapping(value="/contact")
	public String contactGET() {
		return "Tour/contact";
	}
	
	@RequestMapping(value="/contact1")
	public String contact1GET() {
		return "Tour/contact1";
	}
	@RequestMapping(value="/contact2")
	public String contact2GET() {
		return "Tour/contact2";
	}
	@RequestMapping(value="/contact3")
	public String contact3GET() {
		return "Tour/contact3";
	}
	@RequestMapping(value="/contact4")
	public String contact4GET() {
		return "Tour/contact4";
	}
	@RequestMapping(value="/contact5")
	public String contact5GET() {
		return "Tour/contact5";
	}
}
