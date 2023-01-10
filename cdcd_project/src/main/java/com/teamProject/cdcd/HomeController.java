package com.teamProject.cdcd;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamProject.cdcd.dao.CafeDao;
import com.teamProject.cdcd.dao.ReviewDao;
import com.teamProject.cdcd.dto.Cafe;
import com.teamProject.cdcd.dto.ReviewDto;



@Controller
public class HomeController {
	@Autowired
	CafeDao cafeDao;
	@Autowired
	ReviewDao reviewDao;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String cafeList(Model m, @Valid Cafe cafe) throws Exception {

		try {
		  List<ReviewDto> reviewAvg = reviewDao.total_avg();
		  m.addAttribute("reviewAvg", reviewAvg);
		  System.out.println("reviewAvg=" + reviewAvg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "main";
	}
}
