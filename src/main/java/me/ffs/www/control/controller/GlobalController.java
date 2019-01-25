package me.ffs.www.control.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GlobalController {

	private static final Logger logger = LoggerFactory.getLogger(GlobalController.class);
	
	/**
	 * 直接办理页面地址
	 * @return
	 */
	@RequestMapping("t8sdoyoj")
	public String index(){
		return "front/banli";
	}
	
	/**
	 * 先填写兑换码，然后办理
	 * @return
	 */
	@RequestMapping("0em6jtui")
	public String index2(){
		return "front/index";
	}
	
}
