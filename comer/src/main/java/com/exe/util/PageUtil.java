package com.exe.util;

import java.util.HashMap;
import java.util.Map;

public class PageUtil {

	//전체페이지
	
	public int getPageCount(int numPerPage,int dataCount) {
		
		int pageCount = 0;
		pageCount = dataCount / numPerPage; //numPerPage: 표시할 데이터 수
		
		if(dataCount%numPerPage!=0) pageCount++;
		
		return pageCount;
	}
	
	public String pageIndexList(int currentPage,int totalPage,String listUrl) {
		
		int numPerBlock=5;
		int currentPageSetup; //표시할 첫 페이지(6)의 – 1 해준 값(5,10,15,20...)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0||totalPage==0) return "";
		
		if(listUrl.indexOf("?")!=-1) listUrl = listUrl + "&";
		else listUrl = listUrl +"?";
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if(currentPage%numPerBlock==0) currentPageSetup = currentPageSetup - numPerBlock;
		
		//이전
		if(totalPage>numPerBlock && currentPageSetup>0) {
			sb.append("<a href=\""+listUrl+"pageNum="+currentPageSetup +"\">◀이전</a>&nbsp;");
		}
		
		//바로가기
		page = currentPageSetup +1;
		
		while(page<=totalPage && page<=(currentPageSetup + numPerBlock)) {
			
			if(page==currentPage)
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
			else 
				sb.append("<a href=\""+listUrl+"pageNum="+page+"\">"+page+"</a>&nbsp;");
		
			page++;
		}
	
		//다음▶
			if(totalPage - currentPageSetup > numPerBlock){						
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a>&nbsp;");
				
			}
					
			return sb.toString();
	}
	
	public Map<String,Object> getPageCount(String pageNum,int dataCount) {
		
		Map<String,Object> pagemap = new HashMap<String, Object>();
		//String pageNum = request.getParameter("pageNum");
		int currentPage=1;
		
		if(pageNum!=null) currentPage = Integer.parseInt(pageNum);
		
		//int dataCount = togeBoardDAO.getDataCount();
		
		int numPerPage = 10; //페이지 당 데이터
		
		int totalPage = getPageCount(numPerPage, dataCount);
		
		if(currentPage>totalPage) currentPage=totalPage;
		
		int start= (currentPage-1)*numPerPage+1;
		int end=currentPage*numPerPage;
		
		pagemap.put("start", start);
		pagemap.put("end", end);
		pagemap.put("totalPage", totalPage);
		
		return pagemap;
	}
}
