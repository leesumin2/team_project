package com.green.cdcd;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamProject.cdcd.dto.CafeDto;
import com.teamProject.cdcd.dto.MenuDto;
import com.teamProject.cdcd.dto.SearchOption;
import com.teamProject.cdcd.service.CafeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CafeTestTest {

	@Autowired
	CafeService cafeService;
	
//	@Test
//	public void test1() throws Exception {
//		CafeDto cafeDto = new CafeDto("더멜", "0437160557", "충북 청주시", "흥덕구", "주봉로15번길 11");
//		
//		List<MenuDto> menuList = new ArrayList<MenuDto>();
//		menuList.add(new MenuDto("아몬드라떼", 7500));
//		menuList.add(new MenuDto("솔티드 크림라떼", 7000));
//		
//		System.out.println(cafeService.cafe_insert(cafeDto, menuList));
//	}
	
	@Test
	public void test2() throws Exception {
//		CafeDto cafeDto = new CafeDto(14, "더멜", "0437160557", "충북 청주시", "흥덕구", "주봉로15번길 11");
//		
//		List<MenuDto> menuList = new ArrayList<MenuDto>();
//		menuList.add(new MenuDto(10, 14, "아몬드라떼", 7500));
//		menuList.add(new MenuDto(11, 14, "솔티드 크림라떼", 7000));
		
//		System.out.println(cafeService.cafe_update(cafeDto, menuList));

    	SearchOption searchOption = new SearchOption();
        System.out.println(searchOption);
        System.out.println(searchOption.getPageSize());
        System.out.println(searchOption.getOffset());
        List<CafeDto> cafeList = cafeService.selectAll(searchOption);
        System.out.println(searchOption);
        System.out.println("cafeList=" + cafeList.size());
        
	}

}
