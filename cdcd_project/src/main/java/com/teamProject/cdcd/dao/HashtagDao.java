package com.teamProject.cdcd.dao;

import java.util.List;
import java.util.Map;

import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.HashtagDto;
import com.teamProject.cdcd.dto.SearchOption;

public interface HashtagDao {
	
	int insert_hashtag(HashtagDto hashtagDto) throws Exception;

	int insert_cafeHashtag(HashtagDto hashtagDto) throws Exception;

	List<HashtagDto> select(Integer cafe_id) throws Exception;
	
	List<HashtagDto> selectAll() throws Exception;
	
	List<HashtagDto> selectHashtag(List<HashtagDto> hashtag) throws Exception;

	List<CafeDto> search_H(SearchOption searchOption) throws Exception;

	List<CafeDto> search_K_H(SearchOption searchOption) throws Exception;
	
	int deleteCafeHashtag(Map map) throws Exception;

	int deleteHashtag(Integer hashtag_id) throws Exception;

	int deleteAll(Integer cafe_id) throws Exception;
	
}