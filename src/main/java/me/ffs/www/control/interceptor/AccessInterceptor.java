package me.ffs.www.control.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.github.gserv.serv.commons.util.IpUtil;
import com.github.gserv.serv.commons.util.JsonMapper;


/**
 * 接口访问拦截器
 * 
 * 控制访问频率
 * @author btzg
 * @time 2018年11月3日 上午10:27:01
 */
@Component
public class AccessInterceptor implements HandlerInterceptor{
	
	private static final Logger logger = LoggerFactory.getLogger(AccessInterceptor.class);
	
	@Override
	public  boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*记录明细*/
		String remoteIp = IpUtil.getRemoteIp(request);
		String accessUrl = request.getRequestURL().toString();
		Map<String, String[]> parameterMap = request.getParameterMap();
		String jsonString = JsonMapper.toJsonString(parameterMap);

		logger.info("访问明细：ip-->{},url-->{},params-->{},",remoteIp,accessUrl,jsonString);
		return true;
	}
}
