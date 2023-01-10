package com.teamProject.cdcd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.teamProject.cdcd.dao.HashtagDao;
import com.teamProject.cdcd.dao.ReviewDao;
import com.teamProject.cdcd.dto.PageHandler_CafeList;
import com.teamProject.cdcd.dto.SearchOption;
import com.teamProject.cdcd.dto.SearchResultDto;
import com.teamProject.cdcd.service.CafeService;

@Controller
public class SearchResultController {

	@Autowired
	CafeService cafeService;
	
	@Autowired
	HashtagDao hashtagDao;
	
	@Autowired
	ReviewDao reviewDao;
	

	@GetMapping("/searchResult")
	public String searchResult(SearchOption searchOption, Model model, HttpServletRequest request) {

		model.addAttribute("searchOption", searchOption);
		System.out.println("searchOption=" + searchOption);

		try {
			
				List<SearchResultDto> searchResultList = cafeService.searchResultList(searchOption);
				
				int totalCnt = searchResultList.size();
				PageHandler_CafeList pageHandler = new PageHandler_CafeList(totalCnt, searchOption);
				

				model.addAttribute("ph", pageHandler);
				
				model.addAttribute("searchResultList", searchResultList);
				System.out.println("searchResultList=" + searchResultList);
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
			
		 return "searchResult";
	}

}
