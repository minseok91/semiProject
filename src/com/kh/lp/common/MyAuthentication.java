package com.kh.lp.common;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator{
	PasswordAuthentication pa;

	public MyAuthentication(String mailId, String mailPass) {
		pa = new PasswordAuthentication(mailId, mailPass);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
