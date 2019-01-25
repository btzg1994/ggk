package me.ffs.www.control.controller.back;


import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.gserv.serv.commons.restclient.RestClient;
import com.github.gserv.serv.commons.restclient.RestClientException;
import com.github.gserv.serv.commons.util.IpUtil;
import com.github.gserv.serv.commons.util.JsonMapper;
import com.github.pagehelper.PageInfo;
import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;

import me.ffs.www.service.PublicService;


@Controller
@RequestMapping("b")
public class BackController {
	private static final Logger logger =LoggerFactory.getLogger(BackController.class);
	
	/**
	 * 后台登陆页面
	 * 
	 * @return
	 */
	@RequestMapping("index")
	public String index() {
		return "back/login";
	}
	
	
	/**
	 * 后台登出
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "back/login";
	}
	
	
	@RequestMapping("sign/statistics_index")
	public String statisticsIndex() {
		return "back/statistics_index";
	}
	
	@RequestMapping("sign/statistics_trylogin")
	public String statisticsTrylogin() {
		return "back/statistics_trylogin";
	}
	
	/**
	 * 后台登陆
	 * 
	 * @param request
	 * @param loginName
	 * @param loginPwd
	 * @param checkcode
	 * @return
	 */
	@RequestMapping("login")
	public String login(HttpServletRequest request, String loginName, String loginPwd, String checkcode) {
		HttpSession session = request.getSession();
		String remoteIp = IpUtil.getRemoteIp(request);
		try {
			
			// 校验验证码
			String key = (String) session.getAttribute("backend_key");
			if (StringUtils.isBlank(checkcode) || !checkcode.equalsIgnoreCase(key)) {
				request.setAttribute("back_errMsg", "您输入的验证码有误！");
				return "back/login";
			}

			// 校验其余入参
			if (StringUtils.isBlank(loginName) || StringUtils.isBlank(loginPwd)) {
				request.setAttribute("back_errMsg", "用户名或密码格式不正确！");
				return "back/login";
			}

			// 校验用户名密码
			String adminName = PublicService.backLoginName;
			String adminPwd = PublicService.backLoginPwd;
			if (adminName.equals(loginName) && adminPwd.equals(loginPwd)) {
				// 存入session
				session.setAttribute(PublicService.BACK_USER_SESSION, adminName);
				logger.info("后台登陆成功,ip[{}],用户名[{}],密码[{}],验证码[{}]",loginName,loginPwd,checkcode);
				return "back/statistics_index";
			} else {
				logger.info("后台登陆失败,用户名或密码错误,ip[{}],用户名[{}],密码[{}],验证码[{}]",loginName,loginPwd,checkcode);
				request.setAttribute("back_errMsg", "用户名或密码错误！");
				return "back/login";
			}
		} catch (Exception e) {
			logger.info("后台登陆异常,ip[{}],用户名[{}],密码[{}],验证码[{}]",remoteIp,loginName,loginPwd,checkcode);
			logger.error("异常信息：",e);
			return "back/login";
		}

	}
	
	
	
	
	/**
	 * 分页查询统计数据
	 * @param pageNum
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("sign/info_find/{pageNum}/{pageSize}")
	@ResponseBody
	public  String  infoFind(@PathVariable(value = "pageNum",required = false) Integer pageNum ,
			@PathVariable(value = "pageSize",required = false) Integer pageSize,HttpServletRequest request){
		try {
			/*入参处理*/
			if(pageNum == null || pageNum<1){
				pageNum =1;
			}
			if(pageSize == null || pageSize<1){
				pageSize = 10;
			}
			
			return "";
		} catch (Exception e) {
			logger.info("分页查询统计数据异常：",e);
			return "";
		}
	}
	
	
	
	
	
	
}
