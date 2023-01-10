package com.teamProject.cdcd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamProject.cdcd.dao.BookmarkDao;
import com.teamProject.cdcd.dto.BookmarkDto;
import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.service.CafeService;
import com.teamProject.cdcd.service.MemberService;

@Controller
public class BookmarkController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BookmarkDao bookmarkDao;
	
	@Autowired
	CafeService cafeService;
	

	
	@GetMapping("/bookmark")
	public String bookmarkList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("id");
		
		try {
		
			if(memberService.idCheck(mem_id) == null) {
				return "redirect:/Home/login?toURL=" + request.getRequestURL();
			}
			
			List<BookmarkDto> bookmarkList = bookmarkDao.selectBookmarkList(mem_id);
			ArrayList<CafeDto> cafeList = new ArrayList<CafeDto> ();
			
			for(BookmarkDto bookmarkDto : bookmarkList) {
				
				cafeList.add(cafeService.selectCafe(bookmarkDto.getCafe_id()));
			}
			
			model.addAttribute("cafeList", cafeList);
			System.out.println("cafeList=" + cafeList);

		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
				
		return "bookmark";
		
	}
	
	
	@GetMapping("/bookmarkDeleteAll")
	@ResponseBody
	public Integer bookmarkDeleteAll(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("id");
		
		if(mem_id == null) {
//			return "redirect:/Home/login?toURL=" + request.getRequestURL();
			return -1;
		}

		try {
			
			int result = bookmarkDao.deleteAll(mem_id);
	
			System.out.println("deleteAll result=" + result);
			System.out.println("bookmark deleteAll OK!");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
//		return "bookmark";
		return 1;
	}
	
	
	
	@GetMapping("/bookmarkSave")
	@ResponseBody
	public Integer bookmarkSave(Integer cafe_id, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("id");
		System.out.println("mem_id=" + mem_id);
		
		if(mem_id == null) {
			
			System.out.println(request.getRequestURL());
//			return "redirect:/Home/login?toURL=http://localhost/cdcd/cafeInfo?cafe_id=" + cafe_id;
			return -1;
		}
		
		try {
			
			BookmarkDto bookmarkDto = bookmarkDao.selectBookmark(new BookmarkDto(mem_id, cafe_id));
			model.addAttribute("bookmarkDto", bookmarkDto);
			
			if(bookmarkDto != null) {
				
				System.out.println("delete result=" + bookmarkDao.delete(bookmarkDto));
				System.out.println("bookmark delete OK!");
				
	//			return "redirect:/cafeInfo?cafe_id=" + cafe_id;
				return 0;
				
			}
					
			System.out.println("insert result=" + bookmarkDao.insert(new BookmarkDto(mem_id, cafe_id)));
			System.out.println("bookmark insert OK!");
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
//		return "redirect:/cafeInfo?cafe_id=" + cafe_id;
		return 1;
		
	}
	
	
}
