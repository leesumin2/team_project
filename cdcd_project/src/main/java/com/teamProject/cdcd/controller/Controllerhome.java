package com.teamProject.cdcd.controller;


import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamProject.cdcd.dao.CafeDao;
import com.teamProject.cdcd.dao.DBDao;
import com.teamProject.cdcd.dao.ReviewDao;
import com.teamProject.cdcd.dao.wondooDao;
import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.Member;
import com.teamProject.cdcd.dto.ReviewDto;
import com.teamProject.cdcd.dto.Wondoo;





@Controller
@RequestMapping("/Home")
public class Controllerhome {
	@Autowired
	DBDao dbDao;
	@Autowired
	wondooDao wdDao;
	@Autowired
	ReviewDao rv;
	@Autowired
	CafeDao cf;
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	@PostMapping("/login")
	public String login(String id, String pwd, String toURL, HttpServletResponse response, HttpServletRequest request) throws Exception{

		
		if(!loginCheck(id, pwd)) {
			String msg=URLEncoder.encode("id나 비밀번호를 잘못입력했습니다.","utf-8");
			return "redirect:/Home/login?msg="+msg ;
		}

		HttpSession session =request.getSession();
		session.setAttribute("id", id);
		
		toURL = toURL==null || toURL.equals("") ? "/" : toURL;
		
		return "redirect:" + toURL;
	}
	private boolean loginCheck(String id, String pwd) throws Exception{
		Member user=dbDao.selectUser(id);
		if(user==null) {
			return false;
		}
		
		
		return user.getMem_pwd().equals(pwd);
	}
	   @GetMapping("/logout")
	   public String logout(HttpSession session) {
	      session.invalidate();
	      System.out.println("세션종료");
	      return "redirect:/";
	   }
	   
	   @GetMapping("/update")
	   public String InfoUpdate(HttpServletRequest request, Model m) {
	      HttpSession session = request.getSession();
	      String id=(String)session.getAttribute("id");
	      Member user=dbDao.selectUser(id);
	      m.addAttribute("user",user);
	      
	      
	      String userp=user.getMem_phone().substring(0,3);
	      String userp2=user.getMem_phone().substring(3,11);
	      m.addAttribute("userp",userp);
	      m.addAttribute("userp2",userp2);
	      
	      
	      return "modifyInfo";
	   }
	   
	   @PostMapping("/update") 
	   public String InfoUpdate(Model m, Member user, BindingResult result, HttpServletRequest request) throws Exception{
	      HttpSession session = request.getSession();
	      
	      String id=(String)session.getAttribute("id");
	      user=dbDao.selectUser(id);
	      m.addAttribute("user",user);
	   
	      String pwd=request.getParameter("pw");
	      String email=request.getParameter("email");
	      String frontnum=request.getParameter("phone1");
	      String phone=request.getParameter("phone2");
	      

	      Member user2 = new Member(user.getMem_id(), pwd, email, frontnum+phone);
	      int rowCnt=dbDao.updateUser(user2);
	      if(rowCnt!=0) {
	         
	         return "redirect:/";
	      }
	      return "modifyInfo";
	   }

	

	
	
	
	
	@GetMapping("/find")
	public String find() {
		return "find_IdPw";
	}
	@PostMapping("/find")
	public String find( HttpServletResponse response, HttpServletRequest request) throws Exception{
		String email1=request.getParameter("email1");
		String frontnum1=request.getParameter("frontnum1");
		String phone1=request.getParameter("phone1");
		String id2=request.getParameter("id2");
		String email2=request.getParameter("email2");
		String frontnum2=request.getParameter("frontnum2");
		String phone2=request.getParameter("phone2");
		
		HttpSession session =request.getSession();
		session.setAttribute("email", email1);
		
		
	
		if(email1!=null) {
			if(!idCheck(email1, frontnum1, phone1)) {
				String msg1=URLEncoder.encode("해당 정보가 조회되지않습니다.","utf-8");
				return "redirect:/Home/find?msg="+msg1 ;
			}
			Member user=dbDao.selectUser2(email1);
			String msg1=URLEncoder.encode("회원님의 아이디는 "+user.getMem_id()+"입니다.","utf-8");
			return "redirect:/Home/find?msg="+msg1 ;
		}
		if(id2!=null) {
			if(!pwCheck(id2, email2, frontnum2, phone2)) {
				String msg2=URLEncoder.encode("해당 정보가 조회되지않습니다.","utf-8");
				return "redirect:/Home/find?msg="+msg2 ;
			}
			System.out.println("결과="+id2);
			
			Member user=dbDao.selectUser(id2);
			String msg2=URLEncoder.encode("회원님의 비밀번호는 "+user.getMem_pwd()+"입니다.","utf-8");
			return "redirect:/Home/find?msg="+msg2 ;
		}
		return "redirect:/Home/find";
		
	}
	private boolean idCheck(String email, String phone1, String phone2) throws Exception{
		Member user=dbDao.selectUser2(email);
		if(user==null) {
			return false;
		}
		return user.getMem_email().equals(email) & user.getMem_phone().equals(phone1+phone2);
	}
	private boolean pwCheck(String id, String email, String phone1, String phone2) throws Exception{
		Member user=dbDao.selectUser(id);
		if(user==null) {
			return false;
		}
		return user.getMem_id().equals(id) & user.getMem_email().equals(email) & user.getMem_phone().equals(phone1+phone2);
	}
	
	@RequestMapping("/wondoo")
	public String wondoo(Model m, Wondoo wd)throws Exception {
		wd=wdDao.selectCoffeebean("아라비카(Coffea Arabica)");
		m.addAttribute("wd",wd);
		

		return "wondoo";	
	}
	
	@RequestMapping("/dessert")
	public String dessert(Model m, ReviewDto rev)throws Exception {
		String[][] ds=rv.ReviewtopSelect();
		float[] bb=new float[6];
		for (int i=0;i<ds.length;i++) {
			if(ds[i][1]==null) {
				bb[i]= 0;
			}else {
				bb[i]= Float.parseFloat(ds[i][1]);
				bb[i]=Float.parseFloat(String.format("%.1f", bb[i]));
			}
		}
		System.out.println(ds[0][1].getClass().getName()+"dsfsfddsfsfsffsd");
		CafeDto cft1=cf.selectCafe(Integer.parseInt(ds[0][0]));
		m.addAttribute("cft1",cft1);
		CafeDto cft2=cf.selectCafe(Integer.parseInt(ds[1][0]));
		m.addAttribute("cft2",cft2);
		CafeDto cft3=cf.selectCafe(Integer.parseInt(ds[2][0]));
		m.addAttribute("cft3",cft3);
		CafeDto cft4=cf.selectCafe(Integer.parseInt(ds[3][0]));
		m.addAttribute("cft4",cft4);
		CafeDto cft5=cf.selectCafe(Integer.parseInt(ds[4][0]));
		m.addAttribute("cft5",cft5);
		CafeDto cft6=cf.selectCafe(Integer.parseInt(ds[5][0]));
		m.addAttribute("cft6",cft6);
		m.addAttribute("ds",ds);
		m.addAttribute("bb",bb);

		return "dessert";	
	}
	
	
	
	
	
	

	
	
	
	
	
	
}

