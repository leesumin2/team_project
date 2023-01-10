package com.teamProject.cdcd.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamProject.cdcd.dao.BookmarkDao;
import com.teamProject.cdcd.dao.CafeDao;
import com.teamProject.cdcd.dao.HashtagDao;
import com.teamProject.cdcd.dao.MenuDao;
import com.teamProject.cdcd.dao.ReviewDao;
import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.HashtagDto;
import com.teamProject.cdcd.dto.MenuDto;
import com.teamProject.cdcd.dto.SearchOption;
import com.teamProject.cdcd.dto.SearchResultDto;
@Service
public class CafeServiceImpl implements CafeService {

	@Autowired
	CafeDao cafeDao;
	
	@Autowired
	HashtagDao hashtagDao;
	
	@Autowired
	ReviewDao reviewDao;

	@Autowired
	BookmarkDao bookmarkDao;

	@Autowired
	MenuDao menuDao;
	
	@Override
	public int insert(CafeDto cafeDto) throws Exception {
		return cafeDao.insert(cafeDto);
	}

	
	@Override
	public CafeDto selectCafe(Integer cafe_id) throws Exception {
		System.out.println("CafeDao selectCafe is called");
		
		return cafeDao.selectCafe(cafe_id); 
	}
	
	@Override
	public List<CafeDto> selectAll(SearchOption searchOption) throws Exception {
		return cafeDao.selectAll(searchOption);
	}

	@Override
	public int cafeCount() throws Exception {
		return cafeDao.cafeCount();
	}
		
	@Override
	public List<SearchResultDto> searchResultList(SearchOption searchOption) throws Exception {


        List<CafeDto> cafeList = option_search(searchOption);
//      옵션에 맞춰 조회된 cafeDto로 SearchResultDto List 생성( + 정렬)
        
        List<SearchResultDto> searchResultList = new ArrayList<SearchResultDto>();
        
        for(CafeDto cafe : cafeList) {
            
            SearchResultDto searchResultDto = new SearchResultDto(cafe);
            Integer cafe_id = cafe.getCafe_id();
            
            searchResultDto.setHashtagList(hashtagDao.select(cafe_id));     
            searchResultDto.setReviewList(reviewDao.selectCafeReview(cafe_id));
            
            
            searchResultDto.setBookmarkCnt(bookmarkDao.selectBookmarkCnt(cafe_id));
            
            searchResultList.add(searchResultDto);
        }
        
        return searchResultList;
        
    }
    
    
//  관리자 카페 리스트 검색
    @Override
    public List<CafeDto> admin_search(SearchOption searchOption) throws Exception {
        searchOption.setSort("admin");
        List<CafeDto> cafeList = option_search(searchOption);
        
        return cafeList;
        
    }
    
    public List<CafeDto> option_search(SearchOption searchOption) throws Exception {
        String option = "";
        List<CafeDto> cafeList = new ArrayList<CafeDto>();
        try {
            
            if(!searchOption.getKeyword().isEmpty() && searchOption.getHashtag().isEmpty()) {
                option = "K";
            } else if(searchOption.getKeyword().isEmpty() && !searchOption.getHashtag().isEmpty()) {
                option = "H";
            } else if(!searchOption.getKeyword().isEmpty() && !searchOption.getHashtag().isEmpty()){
                option = "K_H";
            } else if(searchOption.getKeyword().isEmpty() && searchOption.getHashtag().isEmpty()) {
                option = "";
            }
        
    //      검색어 옵션에 따른 cafe_id 조회
            if(option.equals("K")) {
                cafeList = cafeDao.search_K(searchOption);
            }
            
    //      검색어 + 해시태그 옵션에 따른 cafe_id 조회
            if(option.equals("K_H")) {
                cafeList = hashtagDao.search_K_H(searchOption);
            }
            
    //      해시태그 옵션에 따른 cafeDto 조회
            if(option.equals("H")) {
                cafeList = hashtagDao.search_H(searchOption);
            }
            
    //      전체 cafeDto 조회
            if(option.equals("")) {
                cafeList = cafeDao.selectAll(searchOption);
            }
        } catch(NullPointerException e) {
            e.printStackTrace();
        }
        
        return cafeList;
    }
    
	
	@Override
	public int cafe_insert(CafeDto cafeDto, List<MenuDto> menuList, List<HashtagDto> hashtagList) throws Exception {
		
		if(cafeDao.insert(cafeDto) == 0) {
			return 0;
		}
				
        try {
            if(menuList.size() > 0) {
                for(MenuDto menuDto : menuList) {
                    menuDto.setCafe_id(cafeDto.getCafe_id());
                    if(menuDao.insert(menuDto) == 0) {
                        return 0;
                    }
                }
            }
            if(hashtagList.size() > 0) {
                for(HashtagDto hashtagDto : hashtagList) {
	                if(hashtagDto.getHashtag_id() != null) {
	                	hashtagDto.setCafe_id(cafeDto.getCafe_id());
	                    if(hashtagDao.insert_cafeHashtag(hashtagDto) == 0) {
	                        return 0;
	                    }
	                }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
		
		return 1;
	}
	
	@Override
	public int cafe_update(CafeDto cafeDto, List<MenuDto> menuList, List<HashtagDto> hashtagList) throws Exception {

		if(cafeDao.update(cafeDto) == 0) {
			return 0;
		}

        try {
            if(menuList.size() > 0) {
                List<Integer> menu_id = new ArrayList<Integer>();
                for(int i=0; i<menuList.size(); i++) {
                    MenuDto menuDto = menuList.get(i);
                    if(menuDto == null) {
                    	menu_id.add(0);
                    }
                    else if(menuDto.getMenu_id() == null && !menuDto.getMenu_signature().isBlank() && menuDto.getMenu_price() != null) {
                        if(menuDao.insert(menuDto) == 0) {
                            return -1;
                        }
                        menu_id.add(menuDto.getMenu_id());
                    }
                    else if(menuDto.getMenu_id() != null) {
                        if(menuDao.update(menuDto) == 0) {
                            return 0;
                        }
                        menu_id.add(menuDto.getMenu_id());
                    }
                }
                System.out.println("menu_id=" + menu_id);
                if(!menu_id.isEmpty()) {
                    Map map = new HashMap();
                    map.put("cafe_id", cafeDto.getCafe_id());
                    map.put("menu_id", menu_id);
                    menuDao.delete(map);
                }
                else {
                    menuDao.deleteAll(cafeDto.getCafe_id());
                }
                
            }
            else {
                menuDao.deleteAll(cafeDto.getCafe_id());
            }
            
            if(hashtagList.size() > 0) {
                List<Integer> hashtag_id = new ArrayList<Integer>();
                for(int i=0; i<hashtagList.size(); i++) {
                    HashtagDto hashtagDto = hashtagList.get(i);
                    if(hashtagDto.getCafe_hashtag_id() == null && hashtagDto.getHashtag_id() != null) {
                        if(hashtagDao.insert_cafeHashtag(hashtagDto) == 0) {
                            return 0;
                        }
                        hashtag_id.add(hashtagDto.getHashtag_id());
                    }
                    else if(hashtagDto.getCafe_hashtag_id() != null && hashtagDto.getHashtag_id() != null) {
                        hashtag_id.add(hashtagDto.getHashtag_id());
                    }
                    
                }
                System.out.println(hashtag_id);
                if(!hashtag_id.isEmpty()) {
                    Map map = new HashMap();
                    map.put("cafe_id", cafeDto.getCafe_id());
                    map.put("hashtag_id", hashtag_id);
                    
                    hashtagDao.deleteCafeHashtag(map);
                        
                }
                else {
                    hashtagDao.deleteAll(cafeDto.getCafe_id());
                }
            }
            else {
                hashtagDao.deleteAll(cafeDto.getCafe_id());
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return 1;
    }
    
    @Override
    public int cafe_delete(Integer cafe_id) throws Exception {
        if(cafeDao.delete(cafe_id) == 0) {
            return 0;
        }
        
        return 1;
    }

}
	
