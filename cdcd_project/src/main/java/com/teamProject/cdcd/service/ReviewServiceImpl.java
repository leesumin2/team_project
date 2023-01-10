package com.teamProject.cdcd.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamProject.cdcd.dao.ReviewDao;
import com.teamProject.cdcd.dto.MemberDto;
import com.teamProject.cdcd.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDao reviewDao;
	
	// 리뷰 글 갯수
	@Override
		public int getCount() throws Exception{
		return reviewDao.count();
	}
	
	// 리뷰 글 쓰기
	@Override
		public int write(ReviewDto reviewDto) throws Exception{
		System.out.println(reviewDto.getReview_img1() + "^^^^^^^^^^^^");
		return reviewDao.insert(reviewDto);
	}
	
	// 리뷰 글 삭제
	@Override
		public int remove(Integer review_id, String mem_id) throws Exception{
		return reviewDao.delete(review_id, mem_id);
	}
	
	
	// 리뷰 목록 출력(최신순)
	@Override 
		public List<ReviewDto> getList() throws Exception{ 
		return reviewDao.selectAll(); 
		}
	// 추가 11.29
	// 리뷰 목록 출력(오래된순)
	@Override 
	public List<ReviewDto> getListOld(Integer cafe_id) throws Exception{ 
		return reviewDao.selectAllOld(cafe_id); 
	}
	// 리뷰 목록 출력(좋아요순)
	@Override 
	public List<ReviewDto> getListLike(Integer cafe_id) throws Exception{ 
		return reviewDao.selectLike(cafe_id); 
	}
	// 끝

	// 리뷰 멤버별 목록 출력
	@Override 
		public List<ReviewDto> getList(String mem_id) throws Exception{ 
		return reviewDao.reviewList(mem_id); 
		}	 
	
	// 리뷰 읽기
	@Override
		public ReviewDto read(Integer review_id) throws Exception{
		ReviewDto reviewDto = reviewDao.select(review_id);
//		reviewDao.increaseViewCnt(review_id);
		return reviewDto;
	}

	
	// 수정
	@Override
		public int modify(ReviewDto reviewDto) throws Exception{
		System.out.println(reviewDto.getReview_content() + "^^^^^^^^^^^^");
		return reviewDao.update(reviewDto);
	}

}
