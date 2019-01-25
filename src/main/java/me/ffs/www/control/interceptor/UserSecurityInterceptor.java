package me.ffs.www.control.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.NamedThreadLocal;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * @author: 456
 * @date: 2018/3/7
 */

@Service
public class UserSecurityInterceptor implements HandlerInterceptor {

    private static final Logger logger = LoggerFactory.getLogger(UserSecurityInterceptor.class);
    private NamedThreadLocal<Long>  startTimeThreadLocal =   new NamedThreadLocal<Long>("StopWatch-StartTime");

    private static String WXOAUTH="wxoauth";

    private static int longFlag=500;

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        //1、开始时间
        long beginTime = System.currentTimeMillis();
        //线程绑定变量（该数据只有当前请求的线程可见）
        startTimeThreadLocal.set(beginTime);

        HttpSession session = request.getSession();
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

        //------
        //登陆控制 此处暂未实现
        System.out.println("******************UserSecurityInterceptor*******************");
        System.out.println("******************UserSecurityInterceptor*******************");
        System.out.println("******************UserSecurityInterceptor*******************");
        System.out.println("******************UserSecurityInterceptor*******************");
        //------

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        //2、结束时间
        long endTime = System.currentTimeMillis();
        //得到线程绑定的局部变量（开始时间）
        long beginTime = startTimeThreadLocal.get();
        //3、消耗的时间
        long consumeTime = endTime - beginTime;
        //此处认为处理时间超过500毫秒的请求为慢请求
        if(consumeTime > longFlag) {
            //TODO 记录到日志文件
            logger.warn(String.format("%s consume %d millis", request.getRequestURI(), consumeTime));
        }
    }

}