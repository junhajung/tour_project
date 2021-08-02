package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.entity.Food;
import com.example.entity.MyUsers;
import com.example.entity.Reply;
import com.example.entity.Stay;
import com.example.entity.Tour;
import com.example.repository.FoodRepository;
import com.example.repository.ReplyRepository;
import com.example.repository.TourRepository;
import com.example.repository.UserRepository;
import com.example.repository.StayRepository;
import com.example.security.JoinService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	private FoodRepository fRepository;
	
	@Autowired
	private UserRepository uRepository;
	
	@Autowired
	private StayRepository sRepository;
	
	@Autowired
	private TourRepository tRepository;

	@Autowired
	private JoinService service;
	
	@Autowired
	private ReplyRepository rRepository;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	

	@RequestMapping(value = "/login")
	public String loginGET() {
		return "User/login";
	}

	@RequestMapping(value = "/joinget")
	public String joinGET() {
		return "User/join";
	}
	
	@RequestMapping(value = "/join")
	public String join(MyUsers user) {
		service.join(user);
		return "redirect:/user/login";
	}

	@RequestMapping(value = "/idcheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String userid = request.getParameter("userid");
		int result = service.idCheck(userid);
		return Integer.toString(result);
	}
	
	// admin 상태일 때 내용 수정
	@RequestMapping(value = "/content_update",  method = RequestMethod.POST)
	public String update(Model model,
			@ModelAttribute Stay stay,
			@ModelAttribute Food food,
			@ModelAttribute Tour tour,
			
			@RequestParam(value="role") String role,
			
			@RequestParam(value="others") String others,
			@RequestParam(value="subtitle") String subtitle,
			@RequestParam(value="prename") String prename,
			@RequestParam(value="name") String name,
			@RequestParam(value="id") String id,
			@RequestParam("img1") MultipartFile file,
			@RequestParam(value="addr") String addr,
			@RequestParam(value="kate") String kate,
			@RequestParam(value="info") String info,
			@RequestParam(value="region") String region,
			@RequestParam(value="tag") String tag,
			@RequestParam(value="content") String content,
			@RequestParam(value="phone") String phone,
			@RequestParam(value="menu") String menu,
			@RequestParam(value="lng") String lng,
			@RequestParam(value="lat") String lat) throws IOException {
		
		if(role.equals("tour")) {
			Tour vo = tRepository.findByName(prename);
			byte[] img = vo.getImage();
			
			if(file.getOriginalFilename() != null ) {
				tour.setImage(file.getBytes());
			}
			if(file.getBytes().length < 1 ) {
				tour.setImage(img);
			}
			tRepository.deleteByName(prename);
			
			tour.setName(name.trim());
			tour.setAddr(addr);
			tour.setKate(kate);
			tour.setContent(content);
			tour.setLat(Double.parseDouble(lat));
			tour.setLng(Double.parseDouble(lng));
			tour.setRegion(region);
			tour.setOthers(others);
			tour.setTag(tag);
			tour.setSubtitle(subtitle);
			
			tRepository.save(tour);
			return "redirect:/tour_details?name=" + URLEncoder.encode(name.trim(), "UTF-8") ;
		}
		else if(role.equals("stay")) {
			Stay vo = sRepository.findByName(prename);
			byte[] img = vo.getImage();
			
			if(file.getOriginalFilename() != null ) {
				stay.setImage(file.getBytes());
			}
			if(file.getBytes().length < 1 ) {
				stay.setImage(img);
			}
			sRepository.deleteByName(prename);
			Double lat1 = Double.parseDouble(lat);
			Double lng1 = Double.parseDouble(lng);
			stay.setName(name.trim());
			stay.setAddr(addr);
			stay.setKate(kate);
			stay.setContent(content);
			stay.setLat(lat1);
			stay.setLng(lng1);
			stay.setRegion(region);
			stay.setInfo(info);
			
			sRepository.save(stay);
			return "redirect:/stay_details?name=" + URLEncoder.encode(name.trim(), "UTF-8") ;
			
		}
		else {
			Food vo = fRepository.findByName(prename);
			byte[] img = vo.getImage();
			
			if(file.getOriginalFilename() != null ) {
				food.setImage(file.getBytes());
			}
			if(file.getBytes().length < 1 ) {
				food.setImage(img);
			}
			fRepository.deleteByName(prename);
			food.setName(name.trim());

			food.setAddr(addr);
			food.setKate(kate);
			food.setPhone(phone);
			food.setContent(content);
			food.setLat(lat);
			food.setLng(lng);
			food.setRegion(region);
			food.setMenu(menu);
			fRepository.save(food);
			return "redirect:/food_details?name=" + URLEncoder.encode(name.trim(), "UTF-8") ;
		}
	}

	// 내 댓글 확인
	@RequestMapping(value = "/myreply")
	public String myreplyGET(Model model, 
			Authentication auth,
			@RequestParam(value = "page", defaultValue = "0") int page) {

		// 페이지 url에 기본 param 값 추가
		if (page == 0) {
			return "redirect:/user/myreply?page=1";
		}

		User user = (User) auth.getPrincipal();
		if (user != null) {
			String id = user.getUsername();

			// 페이지 기능
			// import org.springframework.data.domain.PageRequest;
			PageRequest pageable = PageRequest.of(page - 1, 10);
			
			List<Reply> list = rRepository.findByUseridOrderByCreatedDateDesc(id, pageable);
			model.addAttribute("list", list);

			// 전체 페이지 수 계산.
			// 1->1, 13->2, 24->3 : 10개씩 보이도록
			int totPages = rRepository.countByUserid(id);

			model.addAttribute("totPages", (totPages - 1) / 10 + 1);
		}

		return "User/myreply";
	}



	@RequestMapping(value = "/myinfo")
	public String myinfoGET(HttpServletRequest request, Authentication auth, Model model) throws IOException {

		String menu = request.getParameter("menu");
		if (menu == null) {
			return "redirect:/user/myinfo?menu=1";
		}
		// 스프링 security core 내장 객체 User와 같은 이름의 entity가 있어서 MyUsers로 entity 이름 바꿈
		User user = (User) auth.getPrincipal();
		if (user != null) {
			String id = user.getUsername();
			MyUsers vo = uRepository.findByUserid(id);

			model.addAttribute("vo", vo);

		}

		return "User/myinfo";
	}

	@RequestMapping(value = "/myinfo", method = { RequestMethod.POST })
	public String myinfoPOST(@ModelAttribute MyUsers vo,
			HttpServletResponse response,
			HttpSession httpSession,
			@RequestParam(value = "oldpw") String oldpw,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "phone") String phone,
			@RequestParam(value = "username") String username,
			@RequestParam(value = "userid") String userid) throws IOException {
		BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
		
		MyUsers user = uRepository.findByUserid(userid);
		
		if(bcpe.matches(oldpw, user.getUserpw())) {
			String changePw = bcpe.encode(vo.getUserpw());
			
			user.setUserpw(changePw);
			user.setEmail(email);
			user.setUsername(username);
			user.setPhone(phone);
			
			uRepository.save(user);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			httpSession.invalidate();
			out.println("<script>alert('비밀번호 변경 완료, 다시 로그인 해주세요.'); location.href='http://127.0.0.1:9099/ROOT/home'</script>");
			out.flush();
		}
		else if (oldpw.equals("")) {
			user.setEmail(email);
			user.setUsername(username);
			user.setPhone(phone);
			
			uRepository.save(user);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원정보 변경 완료!'); location.href='http://127.0.0.1:9099/ROOT/user/myinfo?menu=1'</script>");
			out.flush();
		}
		else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('현재 비밀번호가 틀립니다.'); location.href='http://127.0.0.1:9099/ROOT/user/myinfo?menu=1'</script>");
			out.flush();
		}
		
		

		// 페이지 이동
		return "redirect:/user/myinfo?menu=1";
	}
	
	@RequestMapping(value = "/content_list")
	public String content_list(Model model) {

		return "Admin/content_list";
	}

	@RequestMapping(value = "/admin_delete")
	public String admin_delete(Model model, @RequestParam(value = "role") String role,
			@RequestParam(value = "text") String text,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "name") String name) throws UnsupportedEncodingException {
		if (role.equals("stay")) {
			Stay list = sRepository.findByName(name);
			String kate = list.getKate();

			return "redirect:/staykate_list?name=" + URLEncoder.encode(kate, "UTF-8");
		} else if (role.equals("tour")) {
			Tour list = tRepository.findByName(name);
			String kate = list.getRegion();

			return "redirect:/tour_region?region=" + URLEncoder.encode(kate, "UTF-8");
		}
		else if (role.equals("food")) {
			Food list = fRepository.findByName(name);
			String kate = list.getRegion();

			fRepository.deleteByName(name);
			return "redirect:/foodmenu?tag=" + URLEncoder.encode(kate, "UTF-8");
		}
		else if (role.equals("search")) {
			Tour tour = tRepository.findByName(name);
			Stay stay = sRepository.findByName(name);	
			Food food = fRepository.findByName(name);
			
			if(type.equals("all")) {
				
				if(tour != null) {
					tRepository.deleteByName(name);
				}
				else if(stay != null) {
					sRepository.deleteByName(name);
				}
				else {
					fRepository.deleteByName(name);
				}
			}
			
			else if(type.equals("place")) {
				 if(stay != null) {
					sRepository.deleteByName(name);
				 }
			}
			
			else if(type.equals("eat")) {
				 if(food != null) {
					 fRepository.deleteByName(name);
				 }
			}
			
			else if(type.equals("tour")) {
				 if(tour != null) {
					tRepository.deleteByName(name);
				 }
			}
			return "redirect:/search?text=" + URLEncoder.encode(text, "UTF-8") + "&type=" + URLEncoder.encode(type, "UTF-8");
		}
		else {

			Food list = fRepository.findByName(name);
			String kate = list.getRegion();

			fRepository.deleteByName(name);
			return "redirect:/food_region?location=" + URLEncoder.encode(kate, "UTF-8");
		}
	}

	@RequestMapping(value = "/content_insert", method = RequestMethod.POST)
	public String content_insert(Model model, 
			@ModelAttribute Stay stay,

			@ModelAttribute Tour tour, 
			@RequestParam(value = "kate") String kate, 
			@RequestParam(value = "subtitle") String subtitle,
			@RequestParam(value = "others") String others,

			@ModelAttribute Food food, 
			@RequestParam(value = "menu") String menu, 
			@RequestParam(value = "phone") String phone,

			@RequestParam(value = "name") String name, 
			@RequestParam("img1") MultipartFile file,
			@RequestParam(value = "lat") String lat, 
			@RequestParam(value = "lng") String lng,
			@RequestParam(value = "content") String content,
			@RequestParam(value = "region") String region,
			@RequestParam(value = "info") String info, 
			@RequestParam(value = "addr") String addr,

			HttpServletResponse response,
			@RequestParam(value = "role") String role) throws IOException {

		if (role.equals("stay")) {
			Stay find_stay = sRepository.findByName(name);
			if(find_stay == null) {
				if (file.getBytes().length > 0) { // 파일이 첨부되었다면
					stay.setImage(file.getBytes());
				}
				stay.setName(name);
				stay.setLat(Double.parseDouble(lat));
				stay.setLng(Double.parseDouble(lng));
				stay.setContent(content);
				stay.setAddr(addr);
				stay.setKate(kate);
				stay.setRegion(region);
				stay.setInfo(info);
	
				sRepository.save(stay);
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('중복된 이름입니다.'); location.href='http://127.0.0.1:9099/ROOT/user/content_list'</script>");
				out.flush();
			}
		} else if (role.equals("tour")) {
			Tour find_tour = tRepository.findByName(name);
			if(find_tour == null) {
				if (file.getBytes().length > 0) { // 파일이 첨부되었다면
					tour.setImage(file.getBytes());
				}
				tour.setName(name);
				tour.setLat(Double.parseDouble(lat));
				tour.setLng(Double.parseDouble(lng));
				tour.setKate(kate);
				tour.setRegion(region);
				tour.setSubtitle(subtitle);
				tour.setContent(content);
				tour.setAddr(addr);
				tour.setOthers(others);
	
				tRepository.save(tour);
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('중복된 이름입니다.'); location.href='http://127.0.0.1:9099/ROOT/user/content_list'</script>");
				out.flush();
			}
		} else { // food
			Food find_food = fRepository.findByName(name);
			if(find_food == null) {
				if (file.getBytes().length > 0) { // 파일이 첨부되었다면
					food.setImage(file.getBytes());
				}
				food.setName(name);
				food.setLat(lat);
				food.setLng(lng);
				food.setKate(kate);
				food.setMenu(menu);
				food.setPhone(phone);
				food.setContent(content);
				food.setAddr(addr);
				food.setRegion(region);
	
				fRepository.save(food);
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('중복된 이름입니다.'); location.href='http://127.0.0.1:9099/ROOT/user/content_list'</script>");
				out.flush();
			}
		}

		return "redirect:/user/content_list";
	}
	
	// 회원목록
   @RequestMapping(value = "/admin_user")
   public String admin_user(Model model, @RequestParam(value = "page", defaultValue = "0") int page) {

      // 페이지 url에 기본 param 값 추가
      if (page == 0) {
         return "redirect:/user/admin_user?page=1";
      }

      // 페이지 기능
      PageRequest pageable = PageRequest.of(page - 1, 10);

      List<MyUsers> list = uRepository.findAllBy(pageable);
      model.addAttribute("list", list);
      
      // 전체 페이지수 계산
      int totPages = uRepository.countAllBy();
      
      model.addAttribute("totPages", (totPages-1)/10+1);

      return "Admin/admin_user";
   }
   
   
   // admin이 user회원 탈퇴 시키기
	@RequestMapping(value = "/delete")
	public String delete(Model model, @RequestParam(value = "userid") String userid) {

		uRepository.deleteByUserid(userid);

		return "redirect:/user/admin_user";
	}
	
	//회원 탈퇴 추가
	@RequestMapping(value = "/mydelete", method = RequestMethod.POST)
	public String deletePOST(HttpSession httpSession,
			HttpServletResponse response,
			Authentication auth, @ModelAttribute MyUsers vo,
			@RequestParam(value = "userid") String userid,
			@RequestParam(value = "userpw") String userpw) throws IOException {
		
		// 스프링 security core 내장 객체 User와 같은 이름의 entity가 있어서 MyUsers로 entity 이름 바꿈
		User user = (User) auth.getPrincipal();
		System.out.println(user.getUsername());
		System.out.println(userid);
		MyUsers users = uRepository.findByUserid(userid);
		BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
		if (user != null) {
			String id = user.getUsername();
			if (id.equals(userid) && bcpe.matches(userpw, users.getUserpw())) {
				uRepository.deleteByUserid(id);					
				httpSession.invalidate();
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 혹은 비밀번호가 일치하지 않습니다.'); location.href='http://127.0.0.1:9099/ROOT/user/myinfo?menu=2'</script>");
				out.flush();
				
			}
		}
		return "redirect:/home";
	}
}