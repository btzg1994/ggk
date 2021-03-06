package me.ffs.www.control.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.github.gserv.serv.commons.util.IpUtil;

import me.ffs.www.service.PublicService;

public class BackLoginInterceptor implements HandlerInterceptor{
	private static final Logger logger = LoggerFactory.getLogger(BackLoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String remoteIp = IpUtil.getRemoteIp(request);
		Object object = request.getSession().getAttribute(PublicService.BACK_USER_SESSION);
		if(object == null){
			logger.warn("[{}]未登录访问后台",remoteIp);
			response.sendRedirect(request.getContextPath() + "/index");
			return false;
		}
		return true;
	}

}
