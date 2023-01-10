package com.teamProject.cdcd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamProject.cdcd.dto.MemberDto;
import com.teamProject.cdcd.dto.MemberDtoValidator;
import com.teamProject.cdcd.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	@GetMapping("/admin/memList")
	public String list(HttpServletRequest request, Model m, RedirectAttributes redatt)throws Exception
	{	
		if(!loginCheck(request)) {
			redatt.addFlashAttribute("msg", "not_manage");
			return "redirect:/";
		}
		try {
			List<MemberDto> memList = memberService.getList();
			System.out.println(memList);
			m.addAttribute("memList", memList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "admin_memberList";
	}
	
	@GetMapping("/admin/remove")
	public String remove(String mem_id, HttpSession session, Model m, RedirectAttributes redatt) {
		try {
			int rowCnt = memberService.remove(mem_id); 
			if(rowCnt==1) {
				redatt.addFlashAttribute("msg", "memDel");
				return "redirect:/admin/memList";
			}else {
				throw new Exception("memList remove error");
			}
		}catch(Exception e) {
			e.printStackTrace();
			redatt.addFlashAttribute("msg", "error");
		}
		return "redirect:/admin/reviewList";
	}
	
	
	
	private boolean loginCheck(HttpServletRequest request) {
		// 1. ������ ��
		HttpSession session = request.getSession();
		// 2. ���� id�� �ִ��� Ȯ��
		if (session.getAttribute("id") != null && session.getAttribute("id").equals("admin")) {
			return true;
		} else {
			return false;
		}
	}

	@InitBinder
	public void toMember(WebDataBinder binder) {
		binder.setValidator(new MemberDtoValidator());
	}
	
	@GetMapping("/signUp")
	public String signUp() {
		return "SignUp_Form";
	}
	
	@PostMapping("/signUp")
	public String signUpSave(MemberDto memberDto, Model model, Errors errors, HttpServletRequest request) {
		
		System.out.println("phone1=" + request.getParameter("mem_phone1"));
		System.out.println(memberDto);
		
		try {
			
			memberService.signUp(memberDto);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return "SignUp_Success";
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public Integer idCheck(HttpServletRequest request) {
		
		String mem_id = request.getParameter("mem_id");
		
		try {
			System.out.println(memberService.idCheck(mem_id));
			if(memberService.idCheck(mem_id) != null) {
				return 1;
			}			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return 0;

	}
	
	
	@PostMapping("/emailCheck")
	@ResponseBody
	public Integer emailCheck(HttpServletRequest request) {

		String mem_email = request.getParameter("mem_email");
		
		try {

			if(memberService.emailCheck(mem_email) != null) {
				return 1;
			}
	
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}

		return 0;
	}
	
}
