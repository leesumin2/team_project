package com.teamProject.cdcd.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.HashtagDto;
import com.teamProject.cdcd.dto.SearchOption;

@Repository
public class HashtagDaoImpl implements HashtagDao {
	
	@Autowired
	SqlSession session;
	String namespace = "com.teamProject.cdcd.hashtagMapper.";
	
	@Override
	public int insert_hashtag(HashtagDto hashtagDto) throws Exception {
		return session.insert(namespace+"insertHashtag", hashtagDto);
	}
	
	@Override
	public int insert_cafeHashtag(HashtagDto hashtagDto) throws Exception {
		return session.insert(namespace+"insertCafeHashtag", hashtagDto);
	}
	
	@Override
	public List<HashtagDto> select(Integer cafe_id) throws Exception {
		return session.selectList(namespace+"select", cafe_id);
	}
	
	@Override
	public List<HashtagDto> selectAll() throws Exception {
		return session.selectList(namespace+"selectAll");
	}

	@Override
	public List<HashtagDto> selectHashtag(List<HashtagDto> hashtag_id) throws Exception {
		return session.selectList(namespace+"selectHashtag", hashtag_id);
	}

	@Override
	public List<CafeDto> search_H(SearchOption searchOption) throws Exception {
		return session.selectList(namespace+"search_H", searchOption);
	}

	@Override
	public List<CafeDto> search_K_H(SearchOption searchOption) throws Exception {
		return session.selectList(namespace+"search_K_H", searchOption);
	}

	@Override
	public int deleteCafeHashtag(Map map) throws Exception {
		return session.delete(namespace+"deleteCafeHashtag", map);
	}

	@Override
	public int deleteHashtag(Integer hashtag_id) throws Exception {
		return session.delete(namespace+"deleteHashtag", hashtag_id);
	}

	@Override
	public int deleteAll(Integer cafe_id) throws Exception {
		return session.delete(namespace+"deleteAll", cafe_id);
	}
	


}
