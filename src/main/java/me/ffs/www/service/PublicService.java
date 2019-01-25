package me.ffs.www.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import com.github.gserv.serv.commons.restclient.RestClient;

@Service
public class PublicService {
	/**
	 * 后台登陆用户
	 */
	public static final  String BACK_USER_SESSION = "BACK_USER_SESSION";
	
	/**
	 * 前台登陆用户
	 */
	public static final  String FRONT_USER_SESSION = "FRONT_USER_SESSION";
	
	
	/**
	 * 管理员账号
	 */
	public static  String backLoginName;
	
	/**
	 * 管理员密码
	 */
	public static  String backLoginPwd;


	/**
	 * 是否开发模式
	 */
	public static  boolean devMode;

	
	@Value("${back_login_name}")
	public  void setBackLoginName(String backLoginName) {
		PublicService.backLoginName = backLoginName;
	}


	@Value("${back_login_pwd}")
	public  void setBackLoginPwd(String backLoginPwd) {
		PublicService.backLoginPwd = backLoginPwd;
	}


	@Value("${dev_mode}")
	public  void setDevMode(boolean devMode) {
		PublicService.devMode = devMode;
	}

	
	
	
	
	
}
