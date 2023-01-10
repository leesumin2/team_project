package com.teamProject.cdcd.dao;

import java.util.List;

import com.teamProject.cdcd.dto.ReviewLikeDto;

public interface ReviewLikeDao {

	int insert(ReviewLikeDto reviewlikeDto);

	List<ReviewLikeDto> selectAll() throws Exception;

	int likecount(Integer review_id) throws Exception;

	int likefindid(Integer review_id, String mem_id) throws Exception;

	int delete(Integer review_id, String mem_id) throws Exception;

}