package com.teamProject.cdcd.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamProject.cdcd.dao.BoardDaoImpl;
import com.teamProject.cdcd.dto.BoardDto;
import com.teamProject.cdcd.dto.CommentDto;
import com.teamProject.cdcd.dto.PageHandler;
import com.teamProject.cdcd.dto.SearchCondition;
import com.teamProject.cdcd.service.CommentService;


@Controller
public class CommentController {
	
	@Autowired
	CommentService service;


	
	@ResponseBody
	@PatchMapping("/comments/{a_coment_id}")
	public ResponseEntity<String> write(@PathVariable Integer a_coment_id, @RequestBody CommentDto dto, HttpSession session){
		System.out.println("여기로 들어왔다~~~~~~~~~1");
		String mem_id = (String)session.getAttribute("id");
        dto.setMem_id(mem_id);
        System.out.println("****mem_id: "+ dto.getMem_id());
        dto.setA_coment_id(a_coment_id);
        System.out.println("****dto: "+ dto);
		try {
			int cnt = service.modify(dto);
			if(cnt!= 1) throw new Exception("Modify Error");
			return new ResponseEntity<>("MODIFY_OK",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("MODIFY_ERR",HttpStatus.BAD_REQUEST);
		}
	}
	
	
	

	@ResponseBody
	@PostMapping("/comments")
	public ResponseEntity<String> write(@RequestBody CommentDto dto, Integer ask_id, HttpSession session){
		System.out.println("여기로 들어왔다~~~~~~~~~2");
		String mem_id = (String)session.getAttribute("id");
		System.out.println("mem_id==="+mem_id);
		dto.setMem_id(mem_id);
		dto.setAsk_id(ask_id);
		System.out.println("****dto: "+dto);
		try {
			System.out.println("****mem_id: "+ dto.getMem_id());
			int cnt = service.write(dto);
			if(cnt!= 1) throw new Exception("Write Error");
			return new ResponseEntity<>("WRITE_OK",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("WRITE_ERR",HttpStatus.BAD_REQUEST);
		}
	}
	

	@DeleteMapping("/comments/{a_coment_id}") 
	@ResponseBody
	public ResponseEntity<String> remove(@PathVariable Integer a_coment_id, Integer ask_id, String coment_mem_id, HttpSession session){ //추가1
		System.out.println("여기로 들어왔다~~~~~~~~~3");
		String mem_id = (String)session.getAttribute("id");
		//추가1
		if(mem_id.equals("admin")) {
			mem_id=coment_mem_id;
		}
		System.out.println(a_coment_id+","+ask_id);
		try {
			int rowCnt = service.remove(a_coment_id,  ask_id,  mem_id);
			if(rowCnt!=1) {
				throw new Exception("delete failed");
			}
			return new ResponseEntity<>("DEL_OK",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("DEL_ERR",HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@GetMapping("/comments")
	@ResponseBody
	public ResponseEntity<List<CommentDto>> list(Integer ask_id){
		System.out.println("여기로 들어왔다~~~~~~~~~4");
		List<CommentDto> list=null;
		try {
			list = service.getList(ask_id);
			return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK);
		} catch (Exception e) {
			
			e.printStackTrace();
			return new ResponseEntity<List<CommentDto>>(list, HttpStatus.BAD_REQUEST);
		}
		
	}
	//**********************여기부분 이어서
	@GetMapping("/readlist")
	public String read( Model m,  HttpSession session, String mem_id) {
		try {
			Date now = new Date();
			m.addAttribute("now", now);
			String mem_id2 = (String)session.getAttribute("id");
			if(mem_id2.equals("admin")) {
				mem_id2=mem_id;
			}
			List<CommentDto> clist = service.getmemcList(mem_id2);
			m.addAttribute("clist", clist);
			m.addAttribute("mem_id", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
			
		} 
		return "mem_commentlist";
	}
	
	
	
		

}
