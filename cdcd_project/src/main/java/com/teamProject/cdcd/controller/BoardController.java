package com.teamProject.cdcd.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.introspect.TypeResolutionContext.Empty;
import com.teamProject.cdcd.dto.BoardDto;
import com.teamProject.cdcd.dto.CommentDto;
import com.teamProject.cdcd.dto.PageHandler;
import com.teamProject.cdcd.dto.SearchCondition;
import com.teamProject.cdcd.service.BoardService;
import com.teamProject.cdcd.service.CommentService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService boardService;
	@Autowired
	CommentService service;
	
	
	@GetMapping("/write")
	public String write(Model m, HttpSession session) {
		String id = (String)session.getAttribute("id");
		m.addAttribute("mode", "new");
		m.addAttribute("id",id);
		return "board";
	}
	
	@PostMapping("/write")
	public String save(BoardDto boardDto, Model m, HttpSession session, RedirectAttributes reatt) {
		String id = (String)session.getAttribute("id");
		boardDto.setMem_id(id); 
		
		try {
			int rowCnt = boardService.write(boardDto);
			if(rowCnt != 1) throw new Exception("Write Error");
			reatt.addFlashAttribute("msg", "write_ok");
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg", "write_error");
			m.addAttribute("mode", "new"); 
			m.addAttribute("id",id); //********수정
			return "board";
		}
	}
	
	@PostMapping("/modify")
	public String modify(SearchCondition sc, RedirectAttributes reatt, BoardDto boardDto, Model m, HttpSession session) {
		String mem_id = (String)session.getAttribute("id");
		boardDto.setMem_id(mem_id); 
		try {
			int rowCnt = boardService.modify(boardDto);
			if(rowCnt != 1) throw new Exception("modify Error");
			reatt.addFlashAttribute("msg", "modify_ok");
			return "redirect:/board/list"+sc.getQueryString();
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("boardDto", boardDto); 
			m.addAttribute("msg", "modify_error");
			m.addAttribute("m", "renew"); 
			return "board";
		}
	}
	
	
	@PostMapping("/remove")
	public String remove(Integer ask_id, SearchCondition sc, Model m, HttpSession session, RedirectAttributes redatt) {
		
		try {
			String mem_id = (String)session.getAttribute("id");
			if(mem_id.equals("admin")) {
				mem_id=boardService.getSelect(ask_id).getMem_id(); //boardService getselect 부분 추가 
			}
			System.out.println("변경확인===="+ask_id+"***"+mem_id);
			
			
			int rowCntt= service.removeAll(ask_id);
			
			
			
			int rowCnt = boardService.remove(ask_id, mem_id);
			System.out.println("삭제 성공 확인==="+rowCnt);
			/*관리자면 모든 글 삭제될수있게 */
			if(rowCnt==1) {
				
				redatt.addFlashAttribute("msg", "del");
				return "redirect:/board/list"+sc.getQueryString();
			}
			else {
				throw new Exception("board remove error"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
			redatt.addFlashAttribute("msg", "error");
		}
		return "redirect:/board/list"+sc.getQueryString();
	}
	
	
	@GetMapping("/read")
	public String read(Integer ask_id,  SearchCondition sc, Model m) {
		try {
			BoardDto boardDto = boardService.read(ask_id);
			m.addAttribute("boardDto", boardDto);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/board/list"+sc.getQueryString();
		} 
		return "board";
	}
	
	
	@GetMapping("/list")
	public String list(SearchCondition sc, Integer mode,HttpServletRequest request, Model m) {
		System.out.println(sc);
		if(!loginCheck(request)) {
			
			return "redirect:/Home/login?toURL="+request.getRequestURL();
		}
		if(mode==null) {System.out.println("hi");mode=0;}
		try {
			
			int totalCnt = boardService.getSearchResultCnt(sc);
			PageHandler pageHandler = new PageHandler(totalCnt, sc);

			if(mode==0) {
				List<BoardDto> list = boardService.getSearchResultPage0(sc);
				m.addAttribute("list", list);
			}
			else if(mode==1) {
				List<BoardDto> list = boardService.getSearchResultPage1(sc);
				m.addAttribute("list", list);
			}
			else if(mode==2) {
				List<BoardDto> list = boardService.getSearchResultPage2(sc);
				m.addAttribute("list", list);
			}


			m.addAttribute("ph", pageHandler);
			
			
			Date now = new Date();
			m.addAttribute("now", now);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "boardList";
	}
	
	
	@GetMapping("/memlist")
	public String memlist(SearchCondition sc,   String mem_id, Integer mode,HttpServletRequest request, Model m, HttpSession session) {
		System.out.println(sc);
		if(!loginCheck(request)) {
			
			return "redirect://Home/login?toURL="+request.getRequestURL();
		}
		if(mode==null) mode=0;
		try {
			
			//추가
			int totalCnt = boardService.getSearchResultCnt(sc);
			PageHandler pageHandler = new PageHandler(totalCnt, sc);
			m.addAttribute("ph", pageHandler);
			//추가끝
			String mem_id2 = (String)session.getAttribute("id");
			if (mem_id2.equals("admin")) {
				System.out.println("관리자님 로그인이다~~~~~~");
				mem_id2=mem_id;
				System.out.println(mem_id2);
			}
			if(mode==0) {
				List<BoardDto> list = boardService.getmembList(mem_id2);
				m.addAttribute("list", list);
			}
			if(mode==1) {
				List<BoardDto> list = boardService.getviewcList(mem_id2);
				m.addAttribute("list", list);
			}
			if(mode==2) {
				List<BoardDto> list = boardService.getcmtcList(mem_id2);
				m.addAttribute("list", list);
			}
			Date now = new Date();
			m.addAttribute("now", now);
			m.addAttribute("mem_id", mem_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mem_boardlist";
	}
	
	@GetMapping("/view")
	String order(Integer cafe_id, Model model, HttpSession session) throws Exception {
		try {
			return "redirect:/board/memlist?mode="+1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/memlist";
		
	}
	@GetMapping("/neww")
	String neww(Integer cafe_id, Model model, HttpSession session) throws Exception {
		try {
			return "redirect:/board/memlist?mode="+0;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/memlist";
		
	}
	@GetMapping("/comment")
	String comment(Integer cafe_id, Model model, HttpSession session) throws Exception {
		try {
			return "redirect:/board/memlist?mode="+2;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/memlist";
		
	}
	
	
	
	
	
	
	private boolean loginCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();

		if(session.getAttribute("id")!=null) {
			return true;
		}
		else {
			System.out.println("로그인 필요함");

			return false;
		}

	}
}


