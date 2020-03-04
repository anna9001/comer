package com.exe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.exe.dto.TogeBoardDTO;

@Service("togeBoardDAO")
public class TogeBoardDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	Map<String, Object> hmap = new HashMap();
	
	public int getMaxNum(){
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("togeBoardMapper.maxNo");
		
		return maxNum;
	}

	public int getDataCount() {
		
		int result= 0;
		
		result = sessionTemplate.selectOne("togeBoardMapper.dataCount");
		
		return result;
	}
	
	public int insertData(TogeBoardDTO dto) {
	
		return sessionTemplate.insert("togeBoardMapper.insertData",dto);
		
	}
	
	public int updateData(TogeBoardDTO dto) {
		System.out.println(dto.getContent());
		System.out.println(dto.getNo());
		return sessionTemplate.update("togeBoardMapper.updateData",dto);	
	}
	
	public void  updateHitCount(int no) {
		
		hmap.put("no",no);
		sessionTemplate.update("togeBoardMapper.updateHitCount",hmap);

	}
	
	public void  addParticipant(int no,String id) {

		hmap.put("no",no);
		hmap.put("id",id);
		
		sessionTemplate.insert("togeBoardMapper.addParticipant",hmap);
		sessionTemplate.update("togeBoardMapper.updatepParicipant",hmap);
	}
	
	public int checkParticipant(int no,String id) {
		
		int result=0;

		hmap.put("no",no);
		hmap.put("id",id);
		
		result=sessionTemplate.update("togeBoardMapper.checkParticipant",hmap);
		
		return result;
	}
	
	public List<TogeBoardDTO> selectAll(int start,int end) {
		
		List<TogeBoardDTO> lists = new ArrayList();
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		
		hmap.put("start",start);
		hmap.put("end",end);
		
		lists = sessionTemplate.selectList("togeBoardMapper.selectAll",hmap);

		return lists;
	}

	public TogeBoardDTO selectOne(int no) {
		
		TogeBoardDTO dto = new TogeBoardDTO();
		
		hmap.put("no",no);
		
		dto = sessionTemplate.selectOne("togeBoardMapper.selectOne",hmap);
		
		return dto;
	}
	
	public void deleteData(int no) {
		
		System.out.println("dao"+no);
		hmap.put("no",no);
		
		sessionTemplate.delete("togeBoardMapper.deleteData",hmap);
	}
}
