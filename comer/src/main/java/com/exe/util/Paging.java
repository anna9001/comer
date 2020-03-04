package com.exe.util;

import java.util.HashMap;
import java.util.Map;


public class Paging extends PageUtil{
	
	public Map<String,Object> getPageCount(String pageNum,int dataCount) {
		
		Map<String,Object> pagemap = new HashMap<String, Object>();
		//String pageNum = request.getParameter("pageNum");
		int currentPage=1;
		
		if(pageNum!=null) currentPage = Integer.parseInt(pageNum);
		
		//int dataCount = togeBoardDAO.getDataCount();
		
		int numPerPage = 10; //페이지 당 데이터
		
		int totalPage = super.getPageCount(numPerPage, dataCount);
		
		if(currentPage>totalPage) currentPage=totalPage;
		
		int start= (currentPage-1)*numPerPage+1;
		int end=currentPage*numPerPage;
		
		pagemap.put("start", start);
		pagemap.put("end", end);
		pagemap.put("totalPage", totalPage);
		
		return pagemap;
	}
	
}
