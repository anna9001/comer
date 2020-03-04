package com.exe.comer;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.exe.dao.NewsDAO;
import com.exe.dto.NewsDTO;
import com.exe.util.FileUtil;
import com.exe.util.PageUtil;


@Controller
@Transactional
public class NewsController {

	@Autowired
	NewsDAO news;
	
	@Autowired
	PageUtil pageUtil;
	
	@Autowired
	FileUtil fileUtil;
	
	@GetMapping(value = "news.action")
	public String news(HttpSession session,HttpServletRequest request,HttpServletResponse response) {

		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage=1;
		
		if(pageNum!=null) currentPage = Integer.parseInt(pageNum);
		
		int dataCount = news.getDataCount();

		int numPerPage = 10; //페이지 당 데이터
		
		int totalPage = pageUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage>totalPage) currentPage=totalPage;
		
		int start= (currentPage-1)*numPerPage+1;
		int end=currentPage*numPerPage;
		
		String listUrl = cp +"/news.action";
		
		List<NewsDTO> newslist = news.selectAll(start, end);
		
		String pageIndexList = pageUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		String articleUrl = cp +"/readNews.action?pageNum="+currentPage;
		
		System.out.println(newslist.size());
		request.setAttribute("newslist", newslist);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);
		
		return "news/news";
	}
	
	@GetMapping(value = "writeNews.action")
	public String writeNews(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	
		return "news/writeNews";
	}
	
	@RequestMapping(value = "writeNews_ok.action", method=RequestMethod.POST)
	public String writeNews_ok(NewsDTO newsDTO, HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		MultipartFile imageFile = newsDTO.getImageFile();
		
		Path rootPath = Paths.get("C:\\Users\\seungeun\\Documents\\sts-bundle\\work\\comer\\src\\main\\webapp\\resources\\assets\\images\\news");
		String path = request.getServletContext().getRealPath("/resources/assets/images/news");

		if(imageFile.getSize()>0||imageFile.getSize()!=0) {
			
			String fileName= imageFile.getOriginalFilename();			
			newsDTO.setFileName(fileName);
		
			fileUtil.fileSave(rootPath, path, imageFile);

		}
		int maxNo = news.getMaxNum();
		newsDTO.setNo(maxNo+1);
		news.insertData(newsDTO);
		
		return "redirect://news.action";
	}
	
	@RequestMapping(value = "readNews.action", method = RequestMethod.GET)
	public String newsRead(HttpServletRequest request,HttpServletResponse response) {
	
		int no=Integer.parseInt(request.getParameter("no"));
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null)
			pageNum="1";
		
		news.updateHitCount(no);
	
		//게시글 정보 가져오기
		NewsDTO dto=news.selectOne(no);
		NewsDTO pre=news.pre(no);
		NewsDTO next=news.next(no);
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));

		request.setAttribute("dto", dto);
		request.setAttribute("pre", pre);
		request.setAttribute("next", next);
		return "news/readNews";
	}
	
	@DeleteMapping(value="/${no}")
	public ResponseEntity<String> delete(@PathVariable("no") int no){
		
		return news.deleteData(no)==1?new ResponseEntity<String>("success",HttpStatus.OK) :
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
