package com.example.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.example.entity.MyMap;
import com.example.entity.Reply;
import com.example.repository.FoodRepository;
import com.example.repository.ReplyRepository;
import com.example.repository.TourRepository;

@Controller
@RequestMapping(value = "/reply")
public class ReplyController {


	@Autowired
	private ReplyRepository rRepository;
	
	@Autowired
	private TourRepository tRepository;

	@Autowired
	private FoodRepository fRepository;
	
	@Autowired
	private MongoTemplate mTemplate;
	
   // 댓글 일괄 삭제
   @RequestMapping(value="/batchdelete", method=RequestMethod.POST)
   public String batchdeletePOST(@RequestParam(value="chk[]") String[] id) {
   
	   rRepository.deleteAllByIdIn(id);
            
      return "redirect:/user/myreply";
   }
   
	
   // 댓글 남긴 곳으로 이동
	@RequestMapping(value = "/reply_href")
	public String reply_href(@RequestParam(value = "name") String name) throws UnsupportedEncodingException {
		
		if(tRepository.findByName(name) != null) {
			return "redirect:/tour_details?name=" + URLEncoder.encode(name, "UTF-8");
		}
		else if(fRepository.findByName(name) != null) {
			return "redirect:/food_details?name=" + URLEncoder.encode(name, "UTF-8");	
		}
		else {
			return "redirect:/stay_details?name=" + URLEncoder.encode(name, "UTF-8");
		}
	}
	
   
	//본인 댓글 삭제 구현 
	@RequestMapping(value = "/reply_delete")
	public String reply_delete(Model model, 
			@RequestParam(value = "name") String name,
			@RequestParam(value = "id") String id) throws UnsupportedEncodingException {
		
		rRepository.deleteById(id);
		
		if(tRepository.findByName(name) != null) {
			return "redirect:/tour_details?name=" + URLEncoder.encode(name, "UTF-8");
		}
		else if(fRepository.findByName(name) != null) {
			return "redirect:/food_details?name=" + URLEncoder.encode(name, "UTF-8");	
		}
		else {
			return "redirect:/stay_details?name=" + URLEncoder.encode(name, "UTF-8");
		}
	}
	
	//본인 댓글 삭제 구현 
	@RequestMapping(value = "/reply_update")
	public String reply_update(Model model, 
			@ModelAttribute Reply reply,
			Principal principal,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "id") String id,
			@RequestParam(value = "update_reply") String update_reply) throws UnsupportedEncodingException {
		
		String userid = principal.getName();
		
		if(tRepository.findByName(name) != null) {
			Query query = new Query(new Criteria("_id").is(id).and("userid").is(userid));
			Update update = new Update();
			update.set("reply", update_reply);
			mTemplate.upsert(query, update, reply.getClass());
			return "redirect:/tour_details?name=" + URLEncoder.encode(name, "UTF-8");
		}
		else if(fRepository.findByName(name) != null) {
			return "redirect:/food_details?name=" + URLEncoder.encode(name, "UTF-8");	
		}
		else {
			return "redirect:/stay_details?name=" + URLEncoder.encode(name, "UTF-8");
		}
		
	}
	
	
   
	// 댓글 일괄 수정 (GET)
   @RequestMapping(value="/batchupdate", method=RequestMethod.GET)
   public String batchupdateGET(HttpServletRequest request, Model model) {
     
	   //POST에 전달되는 값을 받는 것(1회만)
      Map<String, ?> map = RequestContextUtils.getInputFlashMap(request);
      if(map == null) { //POST에서 값 전달이 되지 않았다면
         return "redirect:/reply/myreply";
      }
      String[] id = (String[]) map.get("id");
      List<Reply> list = new ArrayList<>();
      
      for(int i=0; i<id.length; i++) {
         Optional<Reply> vo = rRepository.findById(id[i]);
         list.add(vo.get());
         System.out.println(id[i] + ",");
      }
      
      model.addAttribute("list", list);
   
      return "User/batchupdate";//view의 item폴더의 batchupdate
   }
   
   // 댓글 일괄 수정 (POST)
   @RequestMapping(value="/batchupdate", method=RequestMethod.POST)
   public String batchupdatePOST(@RequestParam(value="chk[]") String[] id, RedirectAttributes redirectAttributes) {
     
	   redirectAttributes.addFlashAttribute("id", id);
      //127.0.0.1:9090/ROOT/item/barchupdate GET방식으로 전환
      return "redirect:/reply/batchupdate";
   }

   
   @RequestMapping(value="/batchupdate1", method=RequestMethod.POST)
   public String batchupdatePOST(@RequestParam(value="id[]") String[] id,
         @RequestParam(value="userid[]") String[] userid,
         @RequestParam(value="name[]") String[] name,
         @RequestParam(value="reply[]") String[] reply,
         @RequestParam(value="createdDate[]") String[] createdDate) {
      
      if(id.length > 0) {
         
         HashSet<Reply> list = new HashSet<Reply>();

         for(int i=0; i<id.length; i++) {
            Reply vo = new Reply();
            vo.setId(id[i]);
            vo.setUserid(userid[i]);
            vo.setName(name[i]);
            vo.setReply(reply[i]);
            vo.setCreatedDate(createdDate[i]);
            list.add(vo);         
         }               
         rRepository.saveAll(list);
         System.out.println(list);
      }
   
      return "redirect:/user/myreply";
   }
   
}