package com.teamProject.cdcd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.BookmarkDto;

@Repository
public class BookmarkDaoImpl implements BookmarkDao {
	
	@Autowired
	SqlSession session;
	String namespace = "com.teamProject.cdcd.bookmarkMapper.";
	
	@Override
	public BookmarkDto selectBookmark(BookmarkDto bookmarkDto) throws Exception {
		return session.selectOne(namespace+"selectBookmark", bookmarkDto);
	}
		
	@Override
	public List<BookmarkDto> selectBookmarkList(String mem_id) throws Exception {
		return session.selectList(namespace+"selectBookmarkList", mem_id);
	}
	
	@Override
	public int insert(BookmarkDto bookmarkDto) throws Exception {
		return session.insert(namespace+"insert", bookmarkDto);
	}
	
	@Override
	public int delete(BookmarkDto bookmarkDto) throws Exception {
		return session.update(namespace+"delete", bookmarkDto);
	}
	
	@Override
	public int deleteAll(String mem_id) throws Exception {
		return session.update(namespace+"deleteAll", mem_id);
	}
	
	@Override
	public int selectBookmarkCnt(Integer cafe_id) throws Exception {
		return session.selectOne(namespace+"selectBookmarkCnt", cafe_id);
	}
	
}
