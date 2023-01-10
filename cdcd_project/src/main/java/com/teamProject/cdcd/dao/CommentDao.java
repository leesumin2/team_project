package com.teamProject.cdcd.dao;

import java.util.List;
import java.util.Map;

import com.teamProject.cdcd.dto.CommentDto;

public interface CommentDao {

	int deleteAll(Integer ask_id) throws Exception;

	int count(Integer ask_id) throws Exception;

	int delete(Integer a_coment_id, String writer) throws Exception;

	int insert(CommentDto commentDto) throws Exception;

	List<CommentDto> selectAll(Integer ask_id) throws Exception;

	CommentDto select(Integer ask_id);

	int update(CommentDto commentDto);

	List<CommentDto> memselectAll(String mem_id) throws Exception;

}