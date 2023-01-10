package com.green.cdcd;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamProject.cdcd.dao.CafeDao;
import com.teamProject.cdcd.dto.SearchOption;
import com.teamProject.cdcd.service.CafeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class hashtagTest {
	
	@Autowired
	private CafeService cafeService;

	@Autowired
	private CafeDao cafeDao;
	
	@Test
	public void test() throws Exception {

		ArrayList<Integer> hashtag_id = new ArrayList<Integer> (Arrays.asList(1, 2, 3));
		SearchOption so = new SearchOption("아", hashtag_id, "G");
		SearchOption soo = new SearchOption("아", "G");
		SearchOption sooo = new SearchOption(hashtag_id, "G");
		ArrayList<Integer> cafe_id = new ArrayList<Integer> (Arrays.asList(1, 2, 3));
		
		System.out.println(soo.getSort());
		System.out.println(cafeDao.search_K(soo));
	}

	
}
