package com.kh.lp.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class SendEmailWrapper {
	public String getSha512(String pwd) {
		String encPwd = null;
		
		try {
			//Digest는 평문을 암호화할떄 하는 용어
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return encPwd;
	}
}
