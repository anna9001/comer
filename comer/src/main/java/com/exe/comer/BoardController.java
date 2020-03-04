package com.exe.comer;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.exe.dao.CalendarDAO;
import com.exe.dao.MemberDAO;
import com.exe.dao.TogeBoardDAO;
import com.exe.dto.CalendarDTO;
import com.exe.dto.MemberDTO;
import com.exe.dto.TogeBoardDTO;
import com.exe.util.FileUtil;
import com.exe.util.PageUtil;
import com.exe.util.Paging;

@Controller
@Transactional
public class BoardController {
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO memberDAO;
	
	@Autowired
	@Qualifier("togeBoardDAO")
	TogeBoardDAO togeBoardDAO;

	@Autowired
	PageUtil pageUtil;
	
	@Autowired
	FileUtil fileUtil;
	
	
	@Autowired
	@Qualifier("CalDAO")
	CalendarDAO calDAO;
	
	
	@RequestMapping(value = "talk.action", method = RequestMethod.GET)
	public String talk(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	
		return "talk";
	}
	
	@RequestMapping(value = "ComerIntro.action", method = RequestMethod.GET)
	public String ComerIntro(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	
		return "comerIntro";
	}
	@RequestMapping(value = "veganIntro.action", method = RequestMethod.GET)
	public String veganIntro(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	
		return "veganIntro";
	}
	
	@RequestMapping(value = "together.action", method = RequestMethod.GET)
	public String together(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage=1;
		
		if(pageNum!=null) currentPage = Integer.parseInt(pageNum);
		
		int dataCount = togeBoardDAO.getDataCount();
		
		int numPerPage = 10; //페이지 당 데이터
		
		int totalPage = pageUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage>totalPage) currentPage=totalPage;
		
		int start= (currentPage-1)*numPerPage+1;
		int end=currentPage*numPerPage;
		
		String listUrl = cp +"/together.action";
		
		List<TogeBoardDTO> list = togeBoardDAO.selectAll(start, end);
		
		String pageIndexList = pageUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		String articleUrl = cp +"/togeRead.action?pageNum="+currentPage;
		
		request.setAttribute("list", list);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		request.setAttribute("articleUrl", articleUrl);
		
		return "together/together";
	}
	
	//함께 가기 메뉴 작성
	@RequestMapping(value = "writeTogether.action", method = RequestMethod.GET)
	public String writeTogether(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		
		if(dto==null) return "member/login";
		
		String id= dto.getId();
		
		return "together/writeTogether";
	}


	@RequestMapping(value = "writeToge_ok.action", method = {RequestMethod.POST})
	public String writeToge_ok(@ModelAttribute TogeBoardDTO boardDTO,HttpServletRequest request,HttpServletResponse response) {

		MultipartFile imageFile = boardDTO.getImageFile();
		
		Path rootPath = Paths.get("C:\\Users\\seungeun\\Documents\\sts-bundle\\work\\comer\\src\\main\\webapp\\resources\\assets\\images\\togeBoard");
		String path = request.getServletContext().getRealPath("/resources/assets/images/togeBoard");

		int maxNo = togeBoardDAO.getMaxNum();
		boardDTO.setNo(maxNo+1);

		if(imageFile.getSize()>0||imageFile.getSize()!=0) {
			String fileName= imageFile.getOriginalFilename();			
			boardDTO.setFileName(fileName);	
		
			fileUtil.fileSave(rootPath, path, imageFile);

		}
		togeBoardDAO.insertData(boardDTO);
		String msg ="";
		msg = "등록이 완료되었습니다.";
		
		return "redirect://together.action";
	}
	
	@RequestMapping(value = "deleteToge.action", method = RequestMethod.GET)
	public String deleteToge(int no,String pageNum,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	
		togeBoardDAO.deleteData(no);
		
		request.setAttribute("pageNum", pageNum);
		
		return "redirect://together.action";
	}
	
	//함께 가기 게시글 읽기
	@RequestMapping(value = "togeRead.action", method = RequestMethod.GET)
	public String togeRead(HttpServletRequest request,HttpServletResponse response) {
		
		int no=Integer.parseInt(request.getParameter("no"));
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null)
			pageNum="1";
		
		togeBoardDAO.updateHitCount(no);
		
		//게시글 정보 가져오기
		TogeBoardDTO dto=togeBoardDAO.selectOne(no);
		dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
	
		//모임날짜 달력 보여주기  
		CalendarDTO calDTO = null;
		
		Map<String,Integer> todayInfo = calDAO.todayInfo(calDTO);
		List<CalendarDTO> calList = new ArrayList<CalendarDTO>();
		
		//시작일 전 null 삽입
		for(int i=1;i<todayInfo.get("start");i++) {
			calDTO = new CalendarDTO(null,null,null,null);
			calList.add(calDTO);
		}

		//날짜 삽입
		for(int i=todayInfo.get("startDate");i<=todayInfo.get("endDate");i++) {
			
			if(i==todayInfo.get("todayDate")) 
				calDTO = new CalendarDTO(calDTO.getYear(), calDTO.getMonth(), String.valueOf(i), "today");
			else 
				calDTO = new CalendarDTO(calDTO.getYear(), calDTO.getMonth(), String.valueOf(i), "normalday");
			
			calList.add(calDTO);
		}
			
		String eventemp1=dto.getEventDate(); //2020/02/01
		String eventemp2= eventemp1.substring(eventemp1.lastIndexOf("/")+1); //01
		String eventDate = eventemp2.replace("0", "");
		
		//달력 빈 곳에 빈 데이터 삽입
		int index = 7-(calList.size()%7);
		
		if((calList.size()%7) !=0) {
			for(int i=0;i<index;i++) {
				calDTO = new CalendarDTO(null, null, null, null);
				calList.add(calDTO);
			}
		}
	
		request.setAttribute("eventDate", eventDate);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("calList", calList);
		request.setAttribute("boardDTO", dto);
	
		return "together/togeRead";
		
	}
	
	@RequestMapping(value = "togeModi.action",method = {RequestMethod.GET,RequestMethod.POST})
	public String togeModi(String pageNum,int no,HttpServletRequest request,HttpServletResponse response) {
			
		TogeBoardDTO boardDTO = togeBoardDAO.selectOne(no);
		System.out.println(boardDTO.getEventDate());
		
		request.setAttribute("eventDate", boardDTO.getEventDate());
		request.setAttribute("boardDTO",boardDTO);
		request.setAttribute("pageNum", pageNum);
	
		return "together/togeModi";
	}

	@RequestMapping(value = "togeModi_ok.action",method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String togeModi_ok(TogeBoardDTO boardDTO,HttpServletRequest request,HttpServletResponse response) {

		String pageNum = request.getParameter("pageNum");
		
		MultipartFile imageFile = boardDTO.getImageFile();
		Path rootPath = Paths.get("C:\\Users\\seungeun\\Documents\\sts-bundle\\work\\comer\\src\\main\\webapp\\resources\\assets\\images\\togeBoard");
		String path = request.getServletContext().getRealPath("/resources/assets/images/togeBoard");
		
		if(imageFile.getSize()>0) {		
			String fileName= imageFile.getOriginalFilename();			
			boardDTO.setFileName(fileName);		
			fileUtil.fileSave(rootPath, path, imageFile);
		}
		System.out.println(boardDTO.getContent());
		System.out.println(boardDTO.getNo());
		String msg="";
		int result = togeBoardDAO.updateData(boardDTO);
		System.out.println(result);
		if(result==1) msg="Y";
		else msg="N";
		
		return msg;
	}
	
	@RequestMapping(value = "participate.action",produces="application/text;charset=UTF-8")
	public @ResponseBody String participate(String id, int no,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		String msg = "";
		
		int result = togeBoardDAO.checkParticipant(no, id);
		
		if(result>0) { msg = "이미 참여중인 모임입니다."; return msg;}
		
		togeBoardDAO.addParticipant(no, id);
		msg = "참여완료 되었습니다. 마이페이지에서 확인 가능합니다.";
		
		return msg;
	}	
	
	@RequestMapping(value = "/restaurant")
	public  String resta(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	
		return "restaurant/restaurant";
	}
}
