package com.teamProject.cdcd.service;

import java.util.List;

import com.teamProject.cdcd.dto.BookmarkDto;

public interface BookmarkService {

	List<BookmarkDto> selectBookmarkList(String mem_id) throws Exception;

	int insertBookmark(BookmarkDto bookmarkDto) throws Exception;

}