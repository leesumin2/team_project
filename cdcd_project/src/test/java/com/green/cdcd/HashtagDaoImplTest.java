package com.green.cdcd;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamProject.cdcd.dao.HashtagDao;
import com.teamProject.cdcd.dto.CafeDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
class HashtagDaoImplTest {

	@Autowired
	private HashtagDao hashtagDao;
		
	@Test
	void test() throws Exception {
		int cafe_id = 1;
		System.out.println(hashtagDao.select(cafe_id));
	}

}
