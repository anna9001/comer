package com.exe.comer;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.RestaurantDAO;
import com.exe.dto.RestaurantDTO;
import com.exe.util.FileUtil;
import com.exe.util.PageUtil;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/restaurant")
@AllArgsConstructor
@Transactional
public class RetaurantController {
	
	@Autowired
	@Qualifier("restaurantDAO")
	RestaurantDAO restaurantDAO;
	
	@Autowired
	PageUtil pageUtil;
	
	@Autowired
	FileUtil fileUtil;

	@RequestMapping(value= {"","/page/{pageNum}","/page/{pageNum}/category/{category}",
			"/page/{pageNum}/address1/{address1}",		
			"/page/{pageNum}/category/{category}/address1/{address1}"},
			produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity getList(
			@PathVariable (value="pageNum") String pageNum, 
			@PathVariable("category") Optional<String> category, 
			@PathVariable("address1") Optional<String> address1){
	
		int currentPage=1;		
		if(pageNum!=null) currentPage = Integer.parseInt(pageNum);		
		int dataCount = restaurantDAO.getDataCount();		
		int numPerPage = 10; //페이지 당 데이터		
		int totalPage = pageUtil.getPageCount(numPerPage, dataCount);		
		if(currentPage>totalPage) currentPage=totalPage;
		
		System.out.println("dataC : " +dataCount);
		
		int start= (currentPage-1)*numPerPage+1;
		int end=currentPage*numPerPage;
	
		Map<String, Object> hmap = new HashMap<String, Object>();
	
		String option="";
		String option1="";

		if(category.isPresent()) option = category.get();	
		if(address1.isPresent()) option1 = address1.get();
		
		if(option.matches("null")) {hmap.put("category", "");}
		else 						{hmap.put("category", option);}	
		if(option1.matches("null")) {hmap.put("address1", "");}		
		else 						{hmap.put("address1", option1);}
		
		hmap.put("start", start);
		hmap.put("end", end);
	
		String listUrl = "/restaurant";
		
		String pageIndexList = pageUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		/*ModelAndView mav = new ModelAndView();

		/*mav.addObject("pageIndexList",pageIndexList);
		mav.addObject("pageNum",pageNum);
		mav.addObject("lists",lists);
		mav.setViewName("restaurant");
		*/

		return new ResponseEntity<List<RestaurantDTO>>(restaurantDAO.getList(hmap),HttpStatus.OK);
	}
	
	@GetMapping(value="/writeRestaurant",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ModelAndView createGET() throws Exception {
      
		ModelAndView mav = new ModelAndView();	
        mav.setViewName("restaurant/writeRestaurant");
       
        return mav;
    }
	
	@GetMapping(value= "/no/{no}")
	public ModelAndView Readone(@PathVariable int no) {
	
		ModelAndView mav = new ModelAndView();
		
		RestaurantDTO resDTO = restaurantDAO.selectOne(no);
		
		mav.addObject("resDTO",resDTO);
		mav.setViewName("restaurant/readRestaurant");
		
		return mav;
	}
	
	@DeleteMapping(value= "/no/{no}")
	public ResponseEntity<String> delete(@PathVariable int no) {
	
		return restaurantDAO.deleteDate(no)==1?new ResponseEntity<String>("success",HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping("/update/no/{no}")
	public ModelAndView updatePage(@PathVariable int no) {
		ModelAndView mav =new ModelAndView();
		
		RestaurantDTO resDTO = restaurantDAO.selectOne(no);
		mav.addObject("resDTO",resDTO);
		mav.setViewName("restaurant/updateRestaurant");

		return mav;
	}
	
	@PostMapping(value= "/update/no/{no}")
	public ResponseEntity<String> update(HttpServletRequest request,RestaurantDTO resDTO,@RequestParam MultipartFile imageFile,@PathVariable int no) {
	
		ResponseEntity<String> entity =null;
		
		Path rootPath = Paths.get("C:\\Users\\seungeun\\Documents\\sts-bundle\\work\\comer\\src\\main\\webapp\\resources\\assets\\images\\restaurant");
		String path = request.getServletContext().getRealPath("/resources/assets/images/restaurant");
	
		if(imageFile.getSize()>0) {
			String fileName = imageFile.getOriginalFilename();
			resDTO.setFileName(fileName);			
			fileUtil.fileSave(rootPath, path, imageFile);		
		}
		
		int result =restaurantDAO.updateDate(resDTO);
		
		if(result==1) entity=new ResponseEntity<String>("success",HttpStatus.OK);
		else entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

		return entity;		
	
	}
	@RequestMapping(value="/writeRestaurant_ok")
	public ResponseEntity<String> create(HttpServletRequest request,@ModelAttribute RestaurantDTO resDTO,@RequestParam MultipartFile imageFile){

		ResponseEntity<String> entity =null;
		imageFile = resDTO.getImageFile();
		Path rootPath = Paths.get("C:\\Users\\seungeun\\Documents\\sts-bundle\\work\\comer\\src\\main\\webapp\\resources\\assets\\images\\restaurant");
		String path = request.getServletContext().getRealPath("/resources/assets/images/restaurant");
		
		if(imageFile.getSize()>0) {
			String fileName = imageFile.getOriginalFilename();
			resDTO.setFileName(fileName);
					
			fileUtil.fileSave(rootPath, path, imageFile);
		}
	
		int result = restaurantDAO.insertData(resDTO);
		if(result==1) entity=new ResponseEntity<String>("success",HttpStatus.OK);
		else entity=new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);

		return entity;					  
	}

}
