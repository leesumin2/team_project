package com.teamProject.cdcd.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamProject.cdcd.dao.BookmarkDao;
import com.teamProject.cdcd.dto.BookmarkDto;

@Service
public class BookmarkServiceImpl implements BookmarkService {
	
	@Autowired
	BookmarkDao bookmarkDao;
	
	@Override
	public List<BookmarkDto> selectBookmarkList(String mem_id) throws Exception {		
		if(bookmarkDao.selectBookmarkList(mem_id) == null) {
			List<BookmarkDto> bookmarkList = new ArrayList<BookmarkDto> ();
			return bookmarkList;
		}
		return bookmarkDao.selectBookmarkList(mem_id);
	}
	
	@Override
	public int insertBookmark(BookmarkDto bookmarkDto) throws Exception {
		return bookmarkDao.insert(bookmarkDto);
	}
}
