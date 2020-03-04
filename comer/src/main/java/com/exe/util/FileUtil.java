package com.exe.util;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Path;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	public void fileSave(Path rootPath,String path,MultipartFile imageFile) {
		
		try {
			FileOutputStream fos = new FileOutputStream(rootPath+"/"+imageFile.getOriginalFilename());
			FileOutputStream fos1 = new FileOutputStream(path+"/"+imageFile.getOriginalFilename());
			InputStream is = imageFile.getInputStream();
			
			byte[] buffer = new byte[512];
			
			while(true) {
				int data= is.read(buffer,0,buffer.length);
				
				if(data==-1) break;
				
				fos.write(buffer,0,data);
				fos1.write(buffer,0,data);
			}
			is.close();
			fos1.close();
			fos.close();
			
		} catch (Exception e) {
			System.out.println("파일 업로드 에러"+e.toString());
		}
	}
}
