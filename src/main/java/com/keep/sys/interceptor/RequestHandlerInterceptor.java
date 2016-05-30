package com.keep.sys.interceptor;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.keep.entity.user.User;
import com.keep.sys.service.UserService;

public class RequestHandlerInterceptor implements HandlerInterceptor {
	private static final  Logger log = LoggerFactory.getLogger(RequestHandlerInterceptor.class);
	private List<String> excludedUrls;

    public void setExcludedUrls(List<String> excludedUrls) {
        this.excludedUrls = excludedUrls;
    }
    @Autowired
    private UserService userService;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String path = request.getContextPath();
		String basePath = "http://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		PathMatcher matcher = new AntPathMatcher();  
		// String sid = (String)
		// request.getSession().getAttribute(Constant.SESSION_USER_NAME);
		String token = request.getParameter("token");
		String requestUri = request.getRequestURI();
		log.info("request url :" + requestUri);
		for (String url : excludedUrls) {
			if (matcher.match(url, requestUri)) {
				return true;
			}
		}
		Enumeration<String> keys = request.getParameterNames();
		while (keys.hasMoreElements()) {
			String k = keys.nextElement();
			System.out.println(k + " = " + request.getParameter(k));
		}
		
		if (StringUtils.isEmpty(token) || StringUtils.isBlank(token)) {
			log.info("request token : "+ token  +"requestUri :[ " + requestUri + " ]has be deny !!!");
			response.sendRedirect(basePath + "noToken");
			return false;
		} else {

			User u = userService.findByUseToken(token);
			if (null == u){
				// 用户token不存在
				response.sendRedirect(basePath + "noToken");
			return false;
		}
		return true;
	}

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

	}

}
