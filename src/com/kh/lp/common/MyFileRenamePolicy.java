package com.kh.lp.common;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		
		long currentTime = System.currentTimeMillis();
		int randomNumber = (int) (Math.random() * 100000);
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		
		//확장자명 가져오기 
		String name = oldFile.getName();
		String body = "";
		String ext = "";
		int dot = name.lastIndexOf(".");
		
		
		
		if(dot != -1) {
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else {
			body = name;
		}
		
		String fileName = ft.format(new Date(currentTime)) + randomNumber + ext;
		
		File newFile = new File(oldFile.getParent(),fileName);//앞 : 경로 , 뒤 : 파일이름 
		
		return newFile;
	}
	
	

}
