package com.teamProject.cdcd.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamProject.cdcd.dao.BoardDao;
import com.teamProject.cdcd.dto.BoardDto;
import com.teamProject.cdcd.dto.CommentDto;
import com.teamProject.cdcd.dto.SearchCondition;


@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao; 

	@Override
    public BoardDto getSelect(Integer ask_id) throws Exception{
    	return boardDao.select(ask_id);
    }
    @Override
	public int getCount() throws Exception { 
        return boardDao.count();
    }


    @Override
	public int remove(Integer ask_id, String mem_id) throws Exception {
        return boardDao.delete(ask_id, mem_id);
    }


    @Override
	public int write(BoardDto boardDto) throws Exception {
   
    	//throw new Exception("write error");
    	return boardDao.insert(boardDto);
    }
    

    @Override
	public List<BoardDto> getList() throws Exception {
        return boardDao.selectAll();
    }


    @Override
	public BoardDto read(Integer ask_id) throws Exception {
        BoardDto boardDto = boardDao.select(ask_id); 
        boardDao.increaseViewCnt(ask_id);

        return boardDto;
    }

    @Override
	public List<BoardDto> getPage(Map map) throws Exception {
        return boardDao.selectPage(map);
    }


    @Override
	public int modify(BoardDto boardDto) throws Exception {
        return boardDao.update(boardDto);
    }
    

    @Override
	public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return boardDao.searchResultCnt(sc);
    }

    
    @Override
	public List<BoardDto> getSearchResultPage0(SearchCondition sc) throws Exception {
        return boardDao.searchSelectPage0(sc);
    }
    @Override
	public List<BoardDto> getSearchResultPage1(SearchCondition sc) throws Exception {
        return boardDao.searchSelectPage1(sc);
    }
    @Override
	public List<BoardDto> getSearchResultPage2(SearchCondition sc) throws Exception {
        return boardDao.searchSelectPage2(sc);
    }
    
    
    @Override
   	public List<BoardDto> getmembList(String mem_id) throws Exception {
       	return boardDao.memselectAll(mem_id);
       }

    @Override
	public List<BoardDto> getviewcList(String mem_id) throws Exception {
    	return boardDao.viewselectAll(mem_id);
    }
    @Override
	public List<BoardDto> getcmtcList(String mem_id) throws Exception {
    	return boardDao.commentselectAll(mem_id);
    }
    
}