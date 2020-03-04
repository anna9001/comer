package com.exe.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class MemberAuthenticationFailureHandler implements AuthenticationFailureHandler{

	private String id; //�α��� �� ������ input tag name
	private String pw;
	private String redirectName; // �α��� ������ redirect �� �� url �� �����Ǿ� �ִ� input tag name
	private String error;	 // ���� �޼���
	private String defaultFailureUrl; //ȭ�鿡 ������ url �α��� ȭ��!

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
		String redirectName= request.getParameter("redirectName");
	
		request.setAttribute("id", id);
		request.setAttribute("pw", pw);
		request.setAttribute("redirectName", redirectName);
		request.setAttribute("error", exception.getMessage());
		
		request.getRequestDispatcher("/comer/login.action").forward(request, response);
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getRedirectName() {
		return redirectName;
	}

	public void setRedirectName(String redirectName) {
		this.redirectName = redirectName;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

}
