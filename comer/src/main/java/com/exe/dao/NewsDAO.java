package com.exe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.exe.dto.NewsDTO;

@Service("news")
public class NewsDAO {

		private SqlSessionTemplate sessionTemplate;
		
		public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
			this.sessionTemplate=sessionTemplate;
		}
		
		Map<String, Object> hmap = new HashMap();
		
		public int getMaxNum(){
			
			int maxNum = 0;
			
			maxNum = sessionTemplate.selectOne("newsMapper.maxNo");
			
			return maxNum;
		}

		public int getDataCount() {
			
			int result= 0;
			
			result = sessionTemplate.selectOne("newsMapper.dataCount");
			
			return result;
		}
		
		public void insertData(NewsDTO dto) {
		
			sessionTemplate.insert("newsMapper.insertData",dto);
			
		}
		
		public void updateData(NewsDTO dto) {
			
			sessionTemplate.update("newsMapper.updateData",dto);
			
		}
		
		public void  updateHitCount(int no) {
			
			hmap.put("no",no);
			sessionTemplate.update("newsMapper.updateHitCount",hmap);

		}
		
		public List<NewsDTO> selectAll(int start,int end) {
			
			List<NewsDTO> lists = new ArrayList();
			
			HashMap<String, Integer> hmap = new HashMap<String, Integer>();
			
			hmap.put("start",start);
			hmap.put("end",end);
			
			lists = sessionTemplate.selectList("newsMapper.selectAll",hmap);

			return lists;
		}

		public NewsDTO selectOne(int no) {
			
			NewsDTO dto = new NewsDTO();
			hmap.put("no",no);
			
			dto = sessionTemplate.selectOne("newsMapper.selectOne",hmap);
			
			return dto;
		}
		public NewsDTO pre(int no) {
			NewsDTO predto = new NewsDTO();
			hmap.put("no",no);
			predto = sessionTemplate.selectOne("newsMapper.preReadData",hmap);
			
			return predto;
		}
		
		public NewsDTO next(int no) {
			NewsDTO nextdto = new NewsDTO();
			hmap.put("no",no);
			nextdto = sessionTemplate.selectOne("newsMapper.nextReadData",hmap);

			return nextdto;
		}
		
		public List<NewsDTO> selectTop() {
			
			List<NewsDTO> lists =sessionTemplate.selectList("newsMapper.selectTop");
			
			
			return lists;
		}
		
		public int deleteData(int no) {
			
			System.out.println("dao"+no);
			hmap.put("no",no);
			
			return sessionTemplate.delete("newsMapper.deleteData",hmap);
		}
	}

