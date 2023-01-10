package com.green.cdcd;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamProject.cdcd.dao.BookmarkDao;
import com.teamProject.cdcd.dto.BookmarkDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class bookmarkDaoImplTest {

	@Autowired
	BookmarkDao bookmarkDao;
	
	@Test
	public void test() throws Exception {
	
//		로그인 되었다는 가정 하에 테스트 진행
		String mem_id = "asdf1234";
		
//		카페정보 페이지에서 즐겨찾기에 저장 또는 삭제할 cafe_id를 받아옴
		Integer cafe_id = 1;

//		생성한 BookmarkDto가 bookmark DB에 존재하는지 조회
		BookmarkDto bookmarkDto = bookmarkDao.selectBookmark(new BookmarkDto(mem_id, cafe_id));				
		
//		저장한 즐겨찾기가 이미 있다면 bookmarkDB에서 삭제
		if(bookmarkDto != null) {
			System.out.println("delete result=" + bookmarkDao.delete(bookmarkDto));
			System.out.println("bookmark delete OK!");
		}
//		저장한 즐겨찾기가 bookmarkDB에 없으면 새로 추가
		else {
			System.out.println("insert result=" + bookmarkDao.insert(new BookmarkDto(mem_id, cafe_id)));
			System.out.println("bookmark insert OK!");
		}
				
//		생성한 BookmarkDto가 bookmark DB에 존재하는지 조회
		bookmarkDto = bookmarkDao.selectBookmark(new BookmarkDto(mem_id, cafe_id));
		
//		저장한 즐겨찾기가 이미 있다면 bookmarkDB에서 삭제
		if(bookmarkDto != null) {
			System.out.println("delete result=" + bookmarkDao.delete(bookmarkDto));
			System.out.println("bookmark delete OK!");
		}

//		저장한 즐겨찾기가 bookmarkDB에 없으면 새로 추가
		else {
			System.out.println("insert result=" + bookmarkDao.insert(new BookmarkDto(mem_id, cafe_id)));
			System.out.println("bookmark insert OK!");
		}
					
	}
		
	
}
