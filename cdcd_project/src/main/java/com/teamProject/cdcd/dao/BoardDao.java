package com.teamProject.cdcd.dao;

import java.util.List;
import java.util.Map;

import com.teamProject.cdcd.dto.BoardDto;
import com.teamProject.cdcd.dto.CommentDto;
import com.teamProject.cdcd.dto.SearchCondition;

public interface BoardDao {

	int deleteAll(); // int delete(String statement)

	int delete(Integer ask_id, String mem_id) throws Exception; // int delete(String statement, Object parameter)

	int insert(BoardDto dto) throws Exception;// int insert(String statement, Object parameter)

	List<BoardDto> selectAll() throws Exception;// List<E> selectList(String statement)

	BoardDto select(Integer ask_id) throws Exception; // T SelectOne(String statement, Object parameter)

	int increaseViewCnt(Integer ask_id) throws Exception; // int update (String statement, Object parameter)

	int count() throws Exception; // T selectOne(String statement)

	int update(BoardDto dto) throws Exception; // int update(String statement, Object parameter)

	List<BoardDto> selectPage(Map map) throws Exception; // List<E> selectList(String statement, Object parameter)
	
	public List<BoardDto> searchSelectPage0(SearchCondition sc) throws Exception ;
	public List<BoardDto> searchSelectPage1(SearchCondition sc) throws Exception ;
	public List<BoardDto> searchSelectPage2(SearchCondition sc) throws Exception ;
	
	public int searchResultCnt(SearchCondition sc) throws Exception;
	
	public int updateCommentCnt(Integer ask_id, Integer ask_comentcnt) throws Exception;

	List<BoardDto> memselectAll(String mem_id) throws Exception;


	List<BoardDto> viewselectAll(String mem_id) throws Exception;

	List<BoardDto> commentselectAll(String mem_id) throws Exception;
}