package com.exe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.exe.dto.RestaurantDTO;

@Service("restaurantDAO")
public class RestaurantDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int getDataCount() {
		
		int result=0;
		
		result = sessionTemplate.selectOne("restaurantMapper.dataCount");
		
		return result;		
	}
	
	public List<RestaurantDTO> getList(Map hmap){
		
		Map<String,Integer> map = new HashMap<String, Integer>();

		List<RestaurantDTO> lists = new ArrayList<RestaurantDTO>();

		lists = sessionTemplate.selectList("restaurantMapper.getList", hmap);
			System.out.println(lists.size() + "ªÁ¿Ã¡Ó?");
			
		return lists;
	}
	
	public RestaurantDTO selectOne(int no) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("no",no);
		RestaurantDTO dto = sessionTemplate.selectOne("restaurantMapper.getOneData",map);
		
		return dto;		
	}
	
	public int insertData(RestaurantDTO resDTO){

		int no=sessionTemplate.selectOne("restaurantMapper.maxNum");
		resDTO.setNo(no+1);
	
		return sessionTemplate.insert("restaurantMapper.insertData",resDTO);
	}
	
	public int updateDate(RestaurantDTO resDTO){
		
		return sessionTemplate.update("restaurantMapper.updateData",resDTO);
	}
	
	public int deleteDate(int no){
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("no",no);
		
		return sessionTemplate.delete("restaurantMapper.deleteDate",map);	
	}
}
