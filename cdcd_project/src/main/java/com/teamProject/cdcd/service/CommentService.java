package com.teamProject.cdcd.service;

import java.util.List;

import com.teamProject.cdcd.dto.CommentDto;

public interface CommentService {

	int getCount(Integer ask_id) throws Exception;

	
	int remove(Integer a_coment_id, Integer ask_id, String mem_id) throws Exception;

	int write(CommentDto commentDto) throws Exception;

	List<CommentDto> getList(Integer ask_id) throws Exception;
	
	List<CommentDto> getmemcList(String mem_id) throws Exception;
	
	CommentDto read(Integer a_coment_id) throws Exception;

	int modify(CommentDto commentDto) throws Exception;


	int removeAll(Integer bno) throws Exception;

}