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
	
	// ���� �� ����
	@Override
		public int getCount() throws Exception{
		return reviewDao.count();
	}
	
	// ���� �� ����
	@Override
		public int write(ReviewDto reviewDto) throws Exception{
		System.out.println(reviewDto.getReview_img1() + "^^^^^^^^^^^^");
		return reviewDao.insert(reviewDto);
	}
	
	// ���� �� ����
	@Override
		public int remove(Integer review_id, String mem_id) throws Exception{
		return reviewDao.delete(review_id, mem_id);
	}
	
	
	// ���� ��� ���(�ֽż�)
	@Override 
		public List<ReviewDto> getList() throws Exception{ 
		return reviewDao.selectAll(); 
		}
	// �߰� 11.29
	// ���� ��� ���(�����ȼ�)
	@Override 
	public List<ReviewDto> getListOld(Integer cafe_id) throws Exception{ 
		return reviewDao.selectAllOld(cafe_id); 
	}
	// ���� ��� ���(���ƿ��)
	@Override 
	public List<ReviewDto> getListLike(Integer cafe_id) throws Exception{ 
		return reviewDao.selectLike(cafe_id); 
	}
	// ��

	// ���� ����� ��� ���
	@Override 
		public List<ReviewDto> getList(String mem_id) throws Exception{ 
		return reviewDao.reviewList(mem_id); 
		}	 
	
	// ���� �б�
	@Override
		public ReviewDto read(Integer review_id) throws Exception{
		ReviewDto reviewDto = reviewDao.select(review_id);
//		reviewDao.increaseViewCnt(review_id);
		return reviewDto;
	}

	
	// ����
	@Override
		public int modify(ReviewDto reviewDto) throws Exception{
		System.out.println(reviewDto.getReview_content() + "^^^^^^^^^^^^");
		return reviewDao.update(reviewDto);
	}

}
