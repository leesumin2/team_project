package com.teamProject.cdcd.service;

import java.util.List;

import com.teamProject.cdcd.dto.ReviewDto;

public interface ReviewService {

	// ¸®ºä ±Û °¹¼ö
	int getCount() throws Exception;

	// ¸®ºä ±Û ¾²±â
	int write(ReviewDto reviewDto) throws Exception;

	// ¸®ºä ±Û »èÁ¦
	int remove(Integer review_id, String mem_id) throws Exception;

	// ¸®ºä ¸ñ·Ï Ãâ·Â
	List<ReviewDto> getList() throws Exception;
	
	//¸®ºä ¸â¹öº° Ãâ·Â
	List<ReviewDto> getList(String mem_id) throws Exception;
	
	// ¸®ºä ÀÐ±â..?
	ReviewDto read(Integer review_id) throws Exception;

	// ¼öÁ¤
	int modify(ReviewDto reviewDto) throws Exception;

	// Ãß°¡ 11.29
	List<ReviewDto> getListOld(Integer cafe_id) throws Exception;
	List<ReviewDto> getListLike(Integer cafe_id) throws Exception;
	// ³¡



}