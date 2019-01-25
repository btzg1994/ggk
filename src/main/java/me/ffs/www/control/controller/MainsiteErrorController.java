package me.ffs.www.control.controller;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.github.gserv.serv.commons.util.JsonMapper;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author: 456
 * @date: 2018/3/7
 */
@Controller
public class MainsiteErrorController extends DefaultErrorAttributes implements ErrorController {

    private static Logger logger = LoggerFactory.getLogger(MainsiteErrorController.class);

    private static final String ERROR_PATH = "404";

    @RequestMapping(value = ERROR_PATH)
    public String handleError(HttpServletRequest request, HttpServletResponse response) {
        WebRequest webRequest = new ServletWebRequest(request);
        Map<String, Object> body = this.getErrorAttributes(webRequest, false);
        logger.error("server page not found :{}",JsonMapper.toJsonString(body));
        return "404";
    }

    @Override
    public String getErrorPath() {
        return ERROR_PATH;
    }

    @RequestMapping(value={"error","500"})
    public String error500(HttpServletRequest request, HttpServletResponse response) {
        WebRequest webRequest = new ServletWebRequest(request);
        RequestAttributes requestAttr = RequestContextHolder.currentRequestAttributes();
        Map<String, Object> body = this.getErrorAttributes(webRequest, true);
        logger.error("server error:{}",JsonMapper.toJsonString(body));
        return ERROR_PATH;
    }

}