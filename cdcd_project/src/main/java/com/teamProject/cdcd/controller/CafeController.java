package com.teamProject.cdcd.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamProject.cdcd.dao.BookmarkDao;
import com.teamProject.cdcd.dao.HashtagDao;
import com.teamProject.cdcd.dao.MenuDao;
import com.teamProject.cdcd.dao.ReviewDao;
import com.teamProject.cdcd.dao.ReviewLikeDao;
import com.teamProject.cdcd.dto.BookmarkDto;
import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.HashtagDto;
import com.teamProject.cdcd.dto.MenuDto;
import com.teamProject.cdcd.dto.PageHandler_CafeList;
import com.teamProject.cdcd.dto.ReviewDto;
import com.teamProject.cdcd.dto.ReviewLikeDto;
import com.teamProject.cdcd.dto.SearchOption;
import com.teamProject.cdcd.service.CafeService;
import com.teamProject.cdcd.service.MemberService;
import com.teamProject.cdcd.service.ReviewService;

@Controller
public class CafeController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	CafeService cafeService;
	
	@Autowired
	BookmarkDao bookmarkDao;

	@Autowired
	HashtagDao hashtagDao;
	
	@Autowired
	MenuDao menuDao;
	
	@Autowired
	ReviewDao reviewDao;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ResourceLoader rsLoader;
	
	@Autowired
	ReviewLikeDao reviewlikeDao;
	

	String uploadFolder = "C:/resources/cafeImg";
	
	
	
	@GetMapping("/cafeInfo")
	public String cafeInfo(Integer cafe_id, Model model,Integer mode, HttpServletRequest request) {
		
//		int cafe_id = 7;
		//추가-수민
		if(mode==null) mode=0;
		try {
			System.out.println("안녕하세요!!!!!!!!!!!!!" + cafe_id);
			cafeInfo_select(cafe_id, model);
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("id");
			model.addAttribute("mem_id", mem_id);
			
			if(mem_id != null) {
				BookmarkDto bookmarkDto = bookmarkDao.selectBookmark(new BookmarkDto(mem_id, cafe_id));
				System.out.println(bookmarkDto);
				model.addAttribute("bookmarkDto", bookmarkDto);
				
			}		
			//여기 수정 좋아요 부분
			//수정-수민
			List<ReviewDto> reviewDto = null;
			if(mode==0)
				reviewDto = reviewDao.selectCafeReview(cafe_id);
			else if(mode==1)
				reviewDto = reviewService.getListOld(cafe_id);
			else
				reviewDto = reviewService.getListLike(cafe_id);
		    int[] rvlike = new int[reviewDto.size()];
		    int cnt=0;
		    int[] idlike=new int[reviewDto.size()];
		    for(ReviewDto review: reviewDto) {
		       rvlike[cnt]=reviewlikeDao.likecount(review.getReview_id());
		       idlike[cnt]=reviewlikeDao.likefindid(review.getReview_id(), mem_id);
		       cnt++;
		    }
		    model.addAttribute("reviewDto", reviewDto);
		    model.addAttribute("rvlike", rvlike); //리뷰별 좋아요 수 저장
		    model.addAttribute("idlike", idlike); //리뷰별 세션아이디 좋아요 여부 저장

		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return "cafeInfo";
		
	}

	
	@GetMapping("/read")
	public String read(Integer review_id, Model m) {
		try {
			ReviewDto reviewDto = reviewService.read(review_id);
			System.out.println(reviewDto);
			m.addAttribute("reviewDto", reviewDto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "cafeInfo_popup";
	}
    
    @GetMapping("/review_write")
	public String write(Model m, HttpServletRequest request) {
		if(!loginCheck(request)) {
			m.addAttribute("msg", "not_login");
			m.addAttribute("submitted", "x");
		} 
		m.addAttribute("mode", "new");
		return "cafeInfo_popup";
	}
	
	
	@PostMapping(value = "/review_write")
	public String reviewPopup(ReviewDto reviewDto, Model m, HttpSession session,  MultipartFile uploadFile,MultipartFile uploadFile2, RedirectAttributes reatt) throws Exception {
		
		  String mem_id = (String)session.getAttribute("id"); 
		  reviewDto.setMem_id(mem_id);
		  
		  System.out.println("revieDto.img1 =  " + reviewDto.getReview_img1() ); // 평점
		  Integer c_score = reviewDto.getCoffee_score(); 
		  Integer d_score = reviewDto.getDessert_score(); 
		  Integer m_score = reviewDto.getMood_score();
		  System.out.println(reviewDto); 
		  if(c_score==100) { reviewDto.setCoffee_score(null); } 
		  if(d_score==100) { reviewDto.setDessert_score(null); } 
		  if(m_score==100) { reviewDto.setMood_score(null); }
		  
		  System.out.println("reviewDto=" + reviewDto);
			try {
				System.out.println("들어왔다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"); // 멤버 정보를, 현재 로그인하고 있는 id값으로 저장해야 함. 
				System.out.println("reviewDto=" + reviewDto);
				int rowCnt = reviewService.write(reviewDto);
				if (rowCnt != 1)
					throw new Exception("write Error");
					m.addAttribute("msg", "write_ok");
					m.addAttribute("submitted", "o");
				return "cafeInfo_popup";
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("reviewDto", reviewDto);
				m.addAttribute("msg", "write_error");
				return "cafeInfo";
			}

	}
	
	@PostMapping("/modify")
	public String modify(Integer del, Integer del2, ReviewDto reviewDto, Model m, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("id");
		reviewDto.setMem_id(mem_id);
		System.out.println(reviewDto+"***************");
		ReviewDto review = reviewService.read(reviewDto.getReview_id());
		if (del == 1) {
			reviewDto.setReview_img1(review.getReview_img1());
		} else if (del == 3) {
			reviewDto.setReview_img1(null);
		}
		if(del2 == 1) {
			reviewDto.setReview_img2(review.getReview_img2());
		}else if(del2 == 3) {
			reviewDto.setReview_img2(null);
		}
		System.out.println("del!!!!!!!!!!!!!!!!!!!!" + del);
		System.out.println("del2!!!!!!!!!!!!!!!!!!!!" + del2);

		Integer c_score = reviewDto.getCoffee_score(); 
		Integer d_score = reviewDto.getDessert_score(); 
		Integer m_score = reviewDto.getMood_score();
		System.out.println(reviewDto); 
		if(c_score==100) { reviewDto.setCoffee_score(null); } 
		if(d_score==100) { reviewDto.setDessert_score(null); } 
		if(m_score==100) { reviewDto.setMood_score(null); }
		try {
			int rowCnt = reviewService.modify(reviewDto);
			if(rowCnt != 1) throw new Exception("modify_ok");
			m.addAttribute("msg", "modify_ok");
			return "cafeInfo_popup";
		}catch(Exception e) {
			e.printStackTrace();
			m.addAttribute("reviewDto", reviewDto);
			m.addAttribute("msg","modify_error");
			m.addAttribute("m","renew");
			return "cafeInfo_popup";
		}
	}
	
	
	@GetMapping("/remove")
	public String read(Integer review_id,Integer cafe_id, Model m, HttpSession session, RedirectAttributes redatt, MultipartFile uploadFile) {
		String deleteFolder = "C:\\Users\\green\\Documents\\workspace-sts-3.9.17.RELEASE\\wow\\src\\main\\webapp\\resources\\reviewImg";
		String res="";
		try {
			ReviewDto reviewDto = reviewService.read(review_id);
			System.out.println(reviewDto.getReview_img1());
			System.out.println(review_id + " ****************");
			String mem_id = (String) session.getAttribute("id");
			if(mem_id.equals("admin")) {
				mem_id = reviewDto.getMem_id();
			}
			int rowCnt = reviewService.remove(review_id, mem_id);
			File delFile = new File(deleteFolder, reviewDto.getReview_img1());
			File delFile2 = new File(deleteFolder, reviewDto.getReview_img2());
			if (rowCnt == 1) {
				if(delFile.exists()) { // 파일이 존재하면
					delFile.delete(); // 파일 삭제	
					System.out.println("삭제11111!!!!!!!!!!!!!!!들어왔다!");
				}
				if(delFile2.exists()) {
					delFile2.delete();
					System.out.println("삭제2!!!!!!!!!!!!!!!들어왔다!");
				}
				redatt.addFlashAttribute("msg", "del");
				return "redirect:/cafeInfo?cafe_id="+cafe_id;
			} else {
				throw new Exception("board remove error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			redatt.addFlashAttribute("msg", "error");
		}
		return "redirect:/cafeInfo?cafe_id="+cafe_id;
	}

	@ResponseBody
	@GetMapping("/likeg")
	public ResponseEntity<String> likeg(ReviewLikeDto likedto, Integer review_id, HttpSession session) {
		String mem_id = (String) session.getAttribute("id");
		System.out.println("review_id ************" + review_id);
		System.out.println("likeDto****************" + likedto);
		likedto.setMem_id(mem_id);
		likedto.setReview_id(review_id);

		try {
			int cnt = reviewlikeDao.insert(likedto);
			System.out.println("cnt 입니다!!!!! => " + cnt);
			if (cnt != 1)
				throw new Exception("LIKE Error");
			return new ResponseEntity<>("LIKE_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("LIKE_ERR", HttpStatus.BAD_REQUEST);
		}
	}

	@ResponseBody
	@GetMapping("/liked") /* 여기에 삭제하는 메퍼부분 이어서 작성하면 된다!!!-11-24목 여기까지 */
	public ResponseEntity<String> liked(Integer review_id, HttpSession session) {
		String mem_id = (String) session.getAttribute("id");
		System.out.println("review_id ************" + review_id);
		try {
			int cnt = reviewlikeDao.delete(review_id, mem_id);
			System.out.println("cnt 입니다!!!!! => " + cnt);
			if (cnt != 1)
				throw new Exception("LIKE Error");
			return new ResponseEntity<>("LCANCLE_OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("LCANCLE_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	/*
	 * // 리뷰 정렬
	 * 
	 * @GetMapping("/order/new") String newOrder(Integer cafe_id, Model model)
	 * throws Exception { try { return
	 * "redirect:/cafeInfo?cafe_id="+cafe_id+"&mode="+0; }catch(Exception e) {
	 * e.printStackTrace(); } return "redirect:/cafeInfo?cafe_id="+cafe_id; }
	 * 
	 * @GetMapping("/order/old") String oldOrder(Integer cafe_id, Model model)
	 * throws Exception { try { return
	 * "redirect:/cafeInfo?cafe_id="+cafe_id+"&mode="+1; }catch(Exception e) {
	 * e.printStackTrace(); } return "redirect:/cafeInfo?cafe_id="+cafe_id; }
	 * 
	 * @GetMapping("/order/like") String likeOrder(Integer cafe_id, Model model)
	 * throws Exception { try { return "redirect:/cafeInfo?cafe_id=" + cafe_id +
	 * "&mode="+2; } catch (Exception e) { e.printStackTrace(); } return
	 * "redirect:/cafeInfo?cafe_id=" + cafe_id; }
	 */

//	로그인 여부 확인
	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어서
		HttpSession session = request.getSession();
		// 2. 세션 id가 있는지 확인
		if (session.getAttribute("id") != null) {
			return true;
		} else {
			return false;
		}
	}
	
	private String sessionID(HttpServletRequest request) {
		// 1. 세션을 얻어서
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("id");
		// 2. 세션 id가 있는지 확인
		if (mem_id != null) {
			return mem_id;
		} else {
			return null;
		}
	}
	

//	카페 정보 조회
	public void cafeInfo_select(Integer cafe_id, Model model) {
		
		try {
			
			CafeDto cafeDto = cafeService.selectCafe(cafe_id);
			System.out.println("cafeDto=" + cafeDto);
			model.addAttribute("cafeDto", cafeDto);
			
			List<HashtagDto> hashtagDto = hashtagDao.select(cafe_id);
			System.out.println("hashtagDto=" + hashtagDto);
			model.addAttribute("hashtagDto", hashtagDto);
			
			List<MenuDto> menuDto = menuDao.select(cafe_id);
			System.out.println("menuDto=" + menuDto);
			model.addAttribute("menuDto", menuDto);

			Date now = new Date();
			model.addAttribute("now", now);
			List<ReviewDto> reviewDto = reviewDao.selectCafeReview(cafe_id);
			//List<ReviewDto> reviewDtoOld = reviewService.getListOld(cafe_id);
			//List<ReviewDto> reviewDtoLike = reviewService.getListLike(cafe_id);
			//System.out.println("reviewDto=" + reviewDto);
			//System.out.println("reviewDtoOld=" + reviewDtoOld);
			//System.out.println("reviewDtoLike=" + reviewDtoLike);
			 
			model.addAttribute("reviewDto", reviewDto);
			//model.addAttribute("reviewDtoOld", reviewDtoOld);
			//model.addAttribute("reviewDtoLike", reviewDtoLike);

            HashtagDto hashtagAll = new HashtagDto();
            hashtagAll.setHashtagList(hashtagDao.selectAll());
            System.out.println("hashtagAll=" + hashtagAll);
            model.addAttribute("hashtagAll", hashtagAll);
			
				
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		

	}
	
	
	
	
//	admin

//  관리자 전체 카페리스트 조회
    @GetMapping("/admin/cafeMgmt")
    public String cafeMgmt(SearchOption searchOption, Model model, HttpServletRequest request) throws Exception {
    	
		if(sessionID(request) == null || !sessionID(request).equals("admin")) {
			System.out.println(request.getRequestURL());
			return "redirect:/Home/login?toURL=" + request.getRequestURL();
		}

        List<CafeDto> cafeList = cafeService.selectAll(searchOption);
        
        int totalCnt = cafeService.cafeCount();
        PageHandler_CafeList pageHandler = new PageHandler_CafeList(totalCnt, searchOption);
        
        model.addAttribute("ph", pageHandler);
        model.addAttribute("cafeList", cafeList);
        
        System.out.println("cafeList=" + cafeList);
    
    
        return "admin_cafeMgmt";
    }

//  관리자 전체 카페리스트 검색
    @PostMapping("/admin/cafeMgmt")
    public String cafeMgm_search(SearchOption searchOption, Model model, HttpServletRequest request) throws Exception {
    	searchOption.setPage(1);
		if(sessionID(request) == null || !sessionID(request).equals("admin")) {
			System.out.println(request.getRequestURL());
//			return "redirect:/Home/login?toURL=" + request.getRequestURL();
			model.addAttribute("notAdmin", "notAdmin");
			return "admin_cafeMgmt";
		}
    	
    	List<CafeDto> cafeList = cafeService.admin_search(searchOption);
    	int totalCnt = cafeList.size();
    	if(searchOption.getKeyword().isEmpty() && searchOption.getHashtag().isEmpty()) {
    		totalCnt = cafeService.cafeCount();
    	}
        
        PageHandler_CafeList pageHandler = new PageHandler_CafeList(totalCnt, searchOption);
        System.out.println(searchOption);
        model.addAttribute("ph", pageHandler);
        model.addAttribute("cafeList", cafeList);
        
        System.out.println("cafeList=" + cafeList);
        System.out.println("pageHandler=" + pageHandler);
        return "admin_cafeMgmt";
    }
    
//  관리자 카페정보 등록 페이지
    @GetMapping("/admin/cafeMgmt/insert")
    public String cafeInsert(Model model, HttpServletRequest request) throws Exception {

		if(sessionID(request) == null || !sessionID(request).equals("admin")) {
			System.out.println(request.getRequestURL());
//			return "redirect:/Home/login?toURL=" + request.getRequestURL();
			model.addAttribute("notAdmin", "notAdmin");
			return "admin_cafeMgmt";
		}
    	
        HashtagDto hashtagAll = new HashtagDto();
        hashtagAll.setHashtagList(hashtagDao.selectAll());
        System.out.println("hashtagAll=" + hashtagAll);
        model.addAttribute("hashtagAll", hashtagAll);
        
        model.addAttribute("option", "insert");
        
        return "admin_cafeInfo";
    }
    
    @PostMapping("/admin/cafeMgmt/insert")
    @ResponseBody
    public String cafeInsert(CafeDto cafeDto, MenuDto menuDto, HashtagDto hashtagDto, MultipartFile file_upload, Model model, HttpServletRequest request) throws Exception {

		if(sessionID(request) == null || !sessionID(request).equals("admin")) {
			System.out.println(request.getRequestURL());
//			return "redirect:/Home/login?toURL=" + request.getRequestURL();
			model.addAttribute("notAdmin", "notAdmin");
			return "admin_cafeMgmt";
		}
    	
        if(!file_upload.isEmpty()) {
            UUID uuid = UUID.randomUUID();
            cafeDto.setCafe_img(uuid.toString() + "_" + file_upload.getOriginalFilename());
            file_upload.transferTo(new File(uploadFolder, cafeDto.getCafe_img()));
        }
        
        System.out.println("update cafeDto=" + cafeDto);
        System.out.println("update menuDto =" + menuDto);
        System.out.println("update menuDto =" + hashtagDto.getHashtagList());
        
        cafeService.cafe_insert(cafeDto, menuDto.getMenuList(), hashtagDto.getHashtagList());
        
        return "/cdcd/admin/cafeMgmt";
        
//      return cafeService.cafe_update(cafeDto, menuList);
        
    }
    
    
    
//  관리자 카페정보 수정 페이지
    @GetMapping("/admin/cafeMgmt/update")
    public String cafeUpdate(Integer cafe_id, Model model, HttpServletRequest request) throws Exception {

		if(sessionID(request) == null || !sessionID(request).equals("admin")) {
			System.out.println(request.getRequestURL());
//			return "redirect:/Home/login?toURL=" + request.getRequestURL();
			model.addAttribute("notAdmin", "notAdmin");
			return "admin_cafeMgmt";
		}
    	
    	System.out.println("cafe_id=" + cafe_id);
        cafeInfo_select(cafe_id, model);
        
        return "admin_cafeInfo";
    }
    
    @InitBinder
    public void toDate(WebDataBinder binder) {
        SimpleDateFormat df = new SimpleDateFormat("HH:mm");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(df, true));
    }
    
    
    @PostMapping("/admin/cafeMgmt/update")
    @ResponseBody
    public String cafeUpdate(CafeDto cafeDto, MenuDto menuDto, HashtagDto hashtagDto, MultipartFile file_upload, Model model, HttpServletRequest request) throws Exception {

		if(sessionID(request) == null || !sessionID(request).equals("admin")) {
			System.out.println(request.getRequestURL());
	//			return "redirect:/Home/login?toURL=" + request.getRequestURL();
			model.addAttribute("notAdmin", "notAdmin");
			return "admin_cafeMgmt";
		}

        if(!file_upload.isEmpty()) {
            
            UUID uuid = UUID.randomUUID();
            cafeDto.setCafe_img(uuid.toString() + "_" + file_upload.getOriginalFilename());
            file_upload.transferTo(new File(uploadFolder, cafeDto.getCafe_img()));
        }
        System.out.println("update cafeDto=" + cafeDto);
        System.out.println("update menuDto =" + menuDto.getMenuList());
        System.out.println("update hashtagDto =" + hashtagDto.getHashtagList());
        
        cafeService.cafe_update(cafeDto, menuDto.getMenuList(), hashtagDto.getHashtagList());
        
        return "/cdcd/admin/cafeMgmt/update?cafe_id="+cafeDto.getCafe_id();
        
    }
//  카페정보 삭제
    @GetMapping("/admin/cafeMgmt/delete")
    @ResponseBody
    public String cafeDelete(Integer cafe_id, Model model, HttpServletRequest request) throws Exception {
    	System.out.println("sessionID(request)=" + sessionID(request));
		if(sessionID(request) == null || !sessionID(request).equals("admin")) {
			System.out.println(request.getRequestURL());
//			return "redirect:/Home/login?toURL=" + request.getRequestURL();
			model.addAttribute("notAdmin", "notAdmin");
			return "/cdcd/admin_cafeMgmt";
		}
    	System.out.println("cafe_id=" + cafe_id);
        System.out.println(cafeService.cafe_delete(cafe_id));
        
        return "/cdcd/admin/cafeMgmt";
        
    }
    
}
