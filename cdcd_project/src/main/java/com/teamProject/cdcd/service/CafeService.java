package com.teamProject.cdcd.service;

import java.util.List;

import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.HashtagDto;
import com.teamProject.cdcd.dto.MenuDto;
import com.teamProject.cdcd.dto.SearchOption;
import com.teamProject.cdcd.dto.SearchResultDto;

public interface CafeService {

	int insert(CafeDto cafeDto) throws Exception;

	CafeDto selectCafe(Integer cafe_id) throws Exception;

	List<CafeDto> selectAll(SearchOption searchOption) throws Exception;
	
	int cafeCount() throws Exception;
	
	List<SearchResultDto> searchResultList(SearchOption searchOption) throws Exception;
	
	int cafe_insert(CafeDto cafeDto, List<MenuDto> menuList, List<HashtagDto> hashtagList) throws Exception;
	
	int cafe_update(CafeDto cafeDto, List<MenuDto> menuList, List<HashtagDto> hashtagList) throws Exception;
	
	int cafe_delete(Integer cafe_id) throws Exception;
	
	List<CafeDto> admin_search(SearchOption searchOption) throws Exception;
}