package com.exe.dao;

import java.security.PrivateKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.exe.dto.MemberDTO;
import com.exe.dto.TogeBoardDTO;

@Service("memberDAO")
public class MemberDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
  
	//아이디 중복 확인
	public int checkId(String id) {
		
		int result= sessionTemplate.selectOne("memberMapper.checkId",id);
		return result;
	}
	
	//회원가입
	public void insertData(MemberDTO dto) {
		
		sessionTemplate.insert("memberMapper.insertmember",dto);		
	}
	
	//로그인
	public MemberDTO loginMem(String id,String pw) {
	
		Map<String,String> hmap = new HashMap<String, String>();
		
		hmap.put("id", id);
		hmap.put("pw", pw);

		MemberDTO dto = sessionTemplate.selectOne("memberMapper.getOneData",hmap);

		return dto;
	}
	
	public MemberDTO getOneData(String id) {
		
		MemberDTO memDTO = sessionTemplate.selectOne("memberMapper.getOneData", id);
		
		return memDTO;
	}
	public List<TogeBoardDTO> getWData(String id) {
	
		List<TogeBoardDTO> lists=sessionTemplate.selectList("memberMapper.getWdata",id);
		
		return lists;
	}
	
	public List<String> checkParti(int no) {
		System.out.println(no+"dao");
		Map<String,Integer> hmap = new HashMap<String, Integer>();
		
		hmap.put("no", no);
		List<String> lists=sessionTemplate.selectList("memberMapper.checkPart",hmap);
		
		return lists;
	}
	
	
	public List<TogeBoardDTO> getPData(String id) {
		
		List<TogeBoardDTO> lists=sessionTemplate.selectList("memberMapper.getPdata",id);
		
		return lists;
	}
	
	public String decryptRsa(PrivateKey privateKey,String securedValue) {
		
		String decryptedValue="";
		try {
			Cipher cipher= Cipher.getInstance("RSA");
			
			//암호화된 값은 byte, 문자로 넘어온 값은 16진 문자열 hex
			//다시 byte 로 바꿔 복호화해야함
			byte[] encryptedBytes = hexToByteArray(securedValue);
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
			decryptedValue = new String(decryptedBytes,"UTF-8");
						
		} catch (Exception e) {
			System.out.println("decryptRsa error: "+e.toString());
		}
		return decryptedValue;
	}
	
	public static byte[] hexToByteArray(String hex){
		
		if(hex==null||hex.length()%2!=0)  return new byte[]{};
		
		byte[] bytes = new byte[hex.length()/2];
		
		for(int i=0;i<hex.length();i+=2) {
			byte value=(byte)Integer.parseInt(hex.substring(i,i+2),16);
			bytes[(int)Math.floor(i/2)]=value;
		}
		return bytes;
	}
}
