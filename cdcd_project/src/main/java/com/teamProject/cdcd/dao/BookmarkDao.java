package com.teamProject.cdcd.dao;

import java.util.List;

import com.teamProject.cdcd.dto.BookmarkDto;

public interface BookmarkDao {

	BookmarkDto selectBookmark(BookmarkDto bookmarkDto) throws Exception;
	
	List<BookmarkDto> selectBookmarkList(String mem_id) throws Exception;

	int insert(BookmarkDto bookmarkDto) throws Exception;
	
	public int delete(BookmarkDto bookmarkDto) throws Exception;
	
	public int deleteAll(String mem_id) throws Exception;
	
	int selectBookmarkCnt(Integer cafe_id) throws Exception;

}