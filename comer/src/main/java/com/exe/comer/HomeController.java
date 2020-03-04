package com.exe.comer;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import java.util.ArrayList;

import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.MemberDAO;
import com.exe.dao.NewsDAO;
import com.exe.dao.TogeBoardDAO;
import com.exe.dto.MemberDTO;
import com.exe.dto.NewsDTO;
import com.exe.dto.TogeBoardDTO;
import com.exe.security.ShaEncoder;

@Controller
@Transactional
public class HomeController {
	//ȸ������, �α���, ���������� 
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO memberDAO;
	
	@Autowired
	@Qualifier("togeBoardDAO")
	TogeBoardDAO togeBoardDAO;

	@Resource(name="shaEncoder") 
	private ShaEncoder encoder;
	 
	@Autowired
	NewsDAO news;

	@RequestMapping(value = "/" ,method = {RequestMethod.GET,RequestMethod.POST})
	public String home(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();

		List<NewsDTO> newslist = news.selectTop();
		
		request.setAttribute("newslist",newslist);
		return "main";
	}
	

	@RequestMapping(value = "veganintro.action" ,method =RequestMethod.GET)
	public String veganintro(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();

		return "veganIntro";
	}
	
	@RequestMapping(value = "comerintro.action" ,method =RequestMethod.GET)
	public String comerintro(HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();

		return "comerIntro";
	}
	
	
	
	@RequestMapping(value = "login.action", method = {RequestMethod.GET})
	public String login(String error,HttpServletRequest request,HttpServletResponse response) throws NoSuchAlgorithmException, InvalidKeySpecException {
	
		HttpSession session = request.getSession();
		//�α��� ������ _ RSA ��ȣȭ
		
		if(error!=null) System.out.println(error);
		
		return "member/login";
	}
	
	@RequestMapping(value = "login_ok.action", method = {RequestMethod.POST,RequestMethod.GET},produces ="application/text;charset=UTF-8" )
	public @ResponseBody String loginok(HttpSession session,@RequestParam String id,@RequestParam String pw,HttpServletRequest request,HttpServletResponse response) {
	
		List<MemberDTO> memdto = null;
		String loginMsg="";
	
		String enpw = encoder.encoding(pw);
		String msg="";
		//�α��� ���� ó��		
		MemberDTO dto = memberDAO.loginMem(id,enpw);

		if(dto==null) {msg = "N";	}
		else msg="Y";
		
		session.setAttribute("memDTO",dto);

		return msg;
	}
	
	@RequestMapping(value = "myPage.action" ,method = {RequestMethod.GET,RequestMethod.POST})
	public String myPage(@ModelAttribute MemberDTO memDTO,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
	
	//	ModelAndView mav = new ModelAndView();
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		
		if(dto==null) return "member/login";
		
		List<TogeBoardDTO> writeList =new ArrayList(); //�ۼ� ��
		List<TogeBoardDTO> partiList =new ArrayList(); //���� ��
		
		//model.addAttribute("memDTO", dto);
	
		
			String id= dto.getId();
		
		//if(id.equals(null)) { mav.setViewName("member/login"); return mav;}
		
			writeList = memberDAO.getWData(id);
			partiList = memberDAO.getPData(id);
		
		/* catch (Exception e) {
			System.out.println(e.toString());
			mav.setViewName("main"); 
			return mav;
		}*/
		
		//���������� ��� ��, ��� ���, ���� ���� ��ȸ		
		/*mav.addObject("writeList", writeList);
		mav.addObject("partiList", partiList);
		mav.setViewName("member/myPage");*/
			request.setAttribute("memDTO", dto);
		request.setAttribute("writeList", writeList);
		request.setAttribute("partiList", partiList);
		
		return "member/myPage";
	}
	
	@RequestMapping(value = "checkParti.action")
	public @ResponseBody String partiList(int no,HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		
		List<String> lists = memberDAO.checkParti(no);
		String msg="";
		if(lists.size()==0) msg ="������ �����ϴ�.";
		
		
		return msg;
	}
	
	@RequestMapping(value = "logout.action")
	public  String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		
		session.removeAttribute("memDTO");

		session.invalidate();

		return "redirect:/";
	}
	
	
	@RequestMapping(value = "join.action", method = {RequestMethod.GET,RequestMethod.POST})
	public  String join(MemberDTO memdto,HttpServletRequest request,HttpServletResponse response) {
	
		return "member/join";
	}
	
	@RequestMapping(value = "joinMem.action", method = {RequestMethod.POST,RequestMethod.GET},produces="application/text;charset=UTF-8")
	public @ResponseBody String joinMem(MemberDTO memdto,HttpServletRequest request,HttpServletResponse response) {
	
		String msg ="";
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	
		String dbpw = encoder.encoding(pw);
		
		int result=memberDAO.checkId(id);
	
		if(result<=0) {
			memdto.setPw(dbpw);
			memberDAO.insertData(memdto);
			msg ="������ �Ϸ�Ǿ����ϴ�.";
			System.out.println("����");
		}
		else msg= "�ߺ��� ���̵�δ� ������ �� �����ϴ�.";
		
		return msg;
	}
	
	@RequestMapping(value = "checkId.action", method = {RequestMethod.POST,RequestMethod.GET},produces="application/text;charset=UTF-8")
	public @ResponseBody String checkId(String id,HttpServletRequest request,HttpServletResponse response) {
	
		String msg="";
	
		int result=memberDAO.checkId(id);
	
		if(result==0)  msg="��밡���� ���̵��Դϴ�.";
		else msg="�ߺ��� ���̵��Դϴ�.";
		
		return msg;
	}
	
}
