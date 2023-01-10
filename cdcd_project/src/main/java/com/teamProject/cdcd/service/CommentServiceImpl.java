package com.teamProject.cdcd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamProject.cdcd.dao.BoardDao;
import com.teamProject.cdcd.dao.CommentDao;
import com.teamProject.cdcd.dto.CommentDto;
@Service
public class CommentServiceImpl implements CommentService {
//	@Autowired
//	BoardDao boardDao;
//	
//	@Autowired
//	CommentDao commentDao;
	
	private BoardDao boardDao;
	private CommentDao commentDao;
	
	public CommentServiceImpl() {}
	

	@Autowired 
	public CommentServiceImpl(BoardDao boardDao, CommentDao commentDao) {
		super();
		this.boardDao = boardDao;
		this.commentDao = commentDao;
	}

    @Override
	public int getCount(Integer ask_id) throws Exception {
        return commentDao.count(ask_id);
    }


    @Override
	public int remove(Integer a_coment_id, Integer ask_id, String mem_id) throws Exception {


        
        int rowCnt = commentDao.delete(a_coment_id, mem_id);
        System.out.println("a_coment_id="+a_coment_id+", mem_id=" + mem_id);
        System.out.println("rowCnt = " + rowCnt);
        if(rowCnt==1)
        	rowCnt = boardDao.updateCommentCnt(ask_id, -1);

        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
        return rowCnt;
    }
  //변경 
    @Override
    public int removeAll(Integer bno)throws Exception{
    	int rowCnt = commentDao.deleteAll(bno);
    	int cnt=commentDao.count(bno);
    	if(rowCnt==1)
    		rowCnt = boardDao.updateCommentCnt(bno, cnt);
    	return rowCnt;
    }

    @Override
	public int write(CommentDto commentDto) throws Exception {
    	
    	int rowCnt =  commentDao.insert(commentDto);
        if(rowCnt==1)
        	boardDao.updateCommentCnt(commentDto.getAsk_id(), 1);
        
        return rowCnt;
    }


    @Override
	public List<CommentDto> getList(Integer ask_id) throws Exception {
    	return commentDao.selectAll(ask_id);
    }
    @Override
	public List<CommentDto> getmemcList(String mem_id) throws Exception {
    	return commentDao.memselectAll(mem_id);
    }


    @Override
	public CommentDto read(Integer a_coment_id) throws Exception {
        return commentDao.select(a_coment_id);
    }


    @Override
	public int modify(CommentDto commentDto) throws Exception {
        return commentDao.update(commentDto);
    }	
	
}
