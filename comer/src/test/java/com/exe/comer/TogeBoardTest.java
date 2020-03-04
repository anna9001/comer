package com.exe.comer;


import java.sql.Connection;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import com.exe.dao.TogeBoardDAO;
import com.exe.dto.TogeBoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration // 프로젝트의 web.xml이 아닌 가상의 web.xml을 사용하겠다는 의미이다.
@ContextConfiguration( locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})

public class TogeBoardTest {
	private static final Logger logger = LoggerFactory.getLogger(TogeBoardTest.class);

	/*
	 * @Autowired // Dependency Injection(의존성 주입) private WebApplicationContext wac;
	 */
	@Inject
	private TogeBoardDAO boardDAO;

	@Inject
	private DataSource ds;
	
	@Test
	public void testConnection() {
		try(Connection con = ds.getConnection()) {
			logger.info("db 연결" + con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test @Ignore
	public void getlist(){
		List<TogeBoardDTO> lists = boardDAO.selectAll(1, 10);
		int result = boardDAO.getDataCount();
		
		if(lists.size()>0) {
			for(TogeBoardDTO dto:lists) {
				logger.info(dto.getSubject() );
			}
		}else {
			logger.info("데이터 없음");
		}
		logger.info("데이터 수: "+result);
	}
	
	@Test
	public void testInsert() {
		
		TogeBoardDTO dto = new TogeBoardDTO();
		
		int maxNo = boardDAO.getMaxNum();
		
		dto.setNo(maxNo+1);
		dto.setSubject("신촌 도토리칼국수");
		dto.setPlace("신촌");
		dto.setEventDate("02/29/2020");
		dto.setContent("5명이요~ 비건 옵션 가능한 식당입니다.");
		dto.setId("111");
	
		int result= boardDAO.insertData(dto);
		logger.info("insert 완료 " + result);
		if(result==0) logger.info("실패");
		else logger.info("성공 ");
	
	}
	
}
