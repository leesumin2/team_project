package com.teamProject.cdcd.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamProject.cdcd.dao.ReviewLikeDao;
import com.teamProject.cdcd.dto.ReviewDto;
import com.teamProject.cdcd.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ReviewLikeDao reviewlikeDao;
	
	@GetMapping("/reviewList")
	public String list(ReviewDto reviewDto, String mem_id,HttpServletRequest request, Model m, RedirectAttributes redatt)throws Exception
	{	System.out.println("����̵�" + mem_id);
		HttpSession session = request.getSession();
		mem_id = (String)session.getAttribute("id");
		if(mem_id.equals("admin")) {
			mem_id = reviewDto.getMem_id();
		}
		if(!loginCheck(request)) {
			redatt.addFlashAttribute("msg", "not_login");
			System.out.println("�ȳ���մϴ�!!!!!!!!");
			return "redirect:/";
		}
		try {
			System.out.println(mem_id);
			List<ReviewDto> reviewList = reviewService.getList(mem_id);
			Date now = new Date();

			//���� ���� ���ƿ� �κ�
		    int[] rvlike = new int[reviewList.size()];
		    int cnt=0;
		    int[] idlike=new int[reviewList.size()];
		    System.out.println("idlike **********" + idlike);
		    mem_id = (String)session.getAttribute("id");
		    for(ReviewDto review: reviewList) {
								 
		       rvlike[cnt]=reviewlikeDao.likecount(review.getReview_id());
		       idlike[cnt]=reviewlikeDao.likefindid(review.getReview_id(), mem_id);

		       System.out.println("rvlike*********" + reviewlikeDao.likefindid(review.getReview_id(), mem_id));
		       cnt++;
		    }
		    // m.addAttribute("reviewDto", reviewDto);
			m.addAttribute("now", now);
			m.addAttribute("reviewList", reviewList);
		    m.addAttribute("rvlike", rvlike); //���亰 ���ƿ� �� ����
		    m.addAttribute("idlike", idlike); //���亰 ���Ǿ��̵� ���ƿ� ���� ����

			System.out.println("reviewList=" + reviewList);

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "reviewList";
	}
	@GetMapping("/reviewList/remove")
	public String read(Integer review_id,String mem_id, Integer cafe_id, Model m, HttpSession session, RedirectAttributes redatt, MultipartFile uploadFile) {
		String deleteFolder = "C:\\Users\\green\\Documents\\workspace-sts-3.9.17.RELEASE\\wow\\src\\main\\webapp\\resources\\reviewImg";
		String res="";
		try {
			ReviewDto reviewDto = reviewService.read(review_id);
			System.out.println(reviewDto.getReview_img1());
			mem_id = (String) session.getAttribute("id");
			if(mem_id.equals("admin")) {
				mem_id = reviewDto.getMem_id();
			}
			int rowCnt = reviewService.remove(review_id, mem_id);
			File delFile = new File(deleteFolder, reviewDto.getReview_img1());
			File delFile2 = new File(deleteFolder, reviewDto.getReview_img2());
			if (rowCnt == 1) {
				if(delFile.exists()) { // ������ �����ϸ�
					delFile.delete(); // ���� ����	
					System.out.println("����11111!!!!!!!!!!!!!!!���Դ�!");
				}
				if(delFile2.exists()) {
					delFile2.delete();
					System.out.println("����2!!!!!!!!!!!!!!!���Դ�!");
				}
				redatt.addFlashAttribute("msg", "del");
				return "redirect:/reviewList?mem_id="+mem_id;
			} else {
				throw new Exception("board remove error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			redatt.addFlashAttribute("msg", "error");
		}
		return "redirect:/reviewList?mem_id="+mem_id;
	}
	
	private boolean loginCheck(HttpServletRequest request) {
		// 1. ������ ��
		HttpSession session = request.getSession();
		// 2. ���� id�� �ִ��� Ȯ��
		if (session.getAttribute("id") != null) {
			return true;
		} else {
			return false;
		}
	}

}
