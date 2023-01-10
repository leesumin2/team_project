package com.teamProject.cdcd.dao;

import java.util.List;

import com.teamProject.cdcd.dto.ReviewDto;

public interface ReviewDao {
	String[][] ReviewtopSelect();
	
	int deleteAll();

	int delete(Integer review_id, String mem_id) throws Exception;

	int insert(ReviewDto dto) throws Exception;
	
	List<ReviewDto> total_avg() throws Exception;

	List<ReviewDto> selectAll() throws Exception;

	ReviewDto select(Integer review_id) throws Exception;

	//int increaseViewCnt(Integer review_id) throws Exception;

	int update(ReviewDto dto) throws Exception;

	int count() throws Exception;

	List<ReviewDto> selectCafeReview(Integer cafe_id) throws Exception;

	List<ReviewDto> reviewList(String mem_id) throws Exception;
	
	//Ãß°¡
	List<ReviewDto> selectAllOld(Integer cafe_id) throws Exception;
	List<ReviewDto> selectLike(Integer cafe_id) throws Exception;
	
}
