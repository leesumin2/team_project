package com.teamProject.cdcd.service;

import java.util.List;
import java.util.Map;

import com.teamProject.cdcd.dto.BoardDto;
import com.teamProject.cdcd.dto.CommentDto;
import com.teamProject.cdcd.dto.SearchCondition;

public interface BoardService {

	int getCount() throws Exception;

	int remove(Integer ask_id, String mem_id) throws Exception;

	int write(BoardDto boardDto) throws Exception;

	List<BoardDto> getList() throws Exception;

	BoardDto read(Integer ask_id) throws Exception;

	List<BoardDto> getPage(Map map) throws Exception;

	int modify(BoardDto boardDto) throws Exception;

	int getSearchResultCnt(SearchCondition sc) throws Exception;

	List<BoardDto> getSearchResultPage0(SearchCondition sc) throws Exception;
	List<BoardDto> getSearchResultPage1(SearchCondition sc) throws Exception;
	List<BoardDto> getSearchResultPage2(SearchCondition sc) throws Exception;

	BoardDto getSelect(Integer ask_id) throws Exception;

	List<BoardDto> getmembList(String mem_id) throws Exception;

	List<BoardDto> getviewcList(String mem_id) throws Exception;

	List<BoardDto> getcmtcList(String mem_id) throws Exception;

}