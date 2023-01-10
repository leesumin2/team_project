package com.teamProject.cdcd.dao;

import java.util.List;
import java.util.Map;

import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.SearchOption;

public interface CafeDao {

//	ArrayList<Cafe> selectAll();
//
//	Cafe selectCafe(int id);
//	
	int insert(CafeDto cafeDto) throws Exception;
	
	CafeDto selectCafe(Integer cafe_id) throws Exception;
	
	int cafeCount() throws Exception;
	
	List<CafeDto> selectAll(SearchOption searchOption) throws Exception;
	
	List<CafeDto> search_K(SearchOption searchOption) throws Exception;

	int update(CafeDto cafeDto) throws Exception;
	
	int delete(Integer cafe_id) throws Exception;
	
}