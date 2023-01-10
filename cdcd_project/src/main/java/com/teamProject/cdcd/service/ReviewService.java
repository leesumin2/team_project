package com.teamProject.cdcd.service;

import java.util.List;

import com.teamProject.cdcd.dto.ReviewDto;

public interface ReviewService {

	// ���� �� ����
	int getCount() throws Exception;

	// ���� �� ����
	int write(ReviewDto reviewDto) throws Exception;

	// ���� �� ����
	int remove(Integer review_id, String mem_id) throws Exception;

	// ���� ��� ���
	List<ReviewDto> getList() throws Exception;
	
	//���� ����� ���
	List<ReviewDto> getList(String mem_id) throws Exception;
	
	// ���� �б�..?
	ReviewDto read(Integer review_id) throws Exception;

	// ����
	int modify(ReviewDto reviewDto) throws Exception;

	// �߰� 11.29
	List<ReviewDto> getListOld(Integer cafe_id) throws Exception;
	List<ReviewDto> getListLike(Integer cafe_id) throws Exception;
	// ��



}