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
//@WebAppConfiguration // ������Ʈ�� web.xml�� �ƴ� ������ web.xml�� ����ϰڴٴ� �ǹ��̴�.
@ContextConfiguration( locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})

public class TogeBoardTest {
	private static final Logger logger = LoggerFactory.getLogger(TogeBoardTest.class);

	/*
	 * @Autowired // Dependency Injection(������ ����) private WebApplicationContext wac;
	 */
	@Inject
	private TogeBoardDAO boardDAO;

	@Inject
	private DataSource ds;
	
	@Test
	public void testConnection() {
		try(Connection con = ds.getConnection()) {
			logger.info("db ����" + con);
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
			logger.info("������ ����");
		}
		logger.info("������ ��: "+result);
	}
	
	@Test
	public void testInsert() {
		
		TogeBoardDTO dto = new TogeBoardDTO();
		
		int maxNo = boardDAO.getMaxNum();
		
		dto.setNo(maxNo+1);
		dto.setSubject("���� ���丮Į����");
		dto.setPlace("����");
		dto.setEventDate("02/29/2020");
		dto.setContent("5���̿�~ ��� �ɼ� ������ �Ĵ��Դϴ�.");
		dto.setId("111");
	
		int result= boardDAO.insertData(dto);
		logger.info("insert �Ϸ� " + result);
		if(result==0) logger.info("����");
		else logger.info("���� ");
	
	}
	
}
