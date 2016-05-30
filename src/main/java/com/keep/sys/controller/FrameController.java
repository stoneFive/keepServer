package com.keep.sys.controller;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.keep.entity.MessageBean;
import com.keep.entity.user.User;
import com.keep.sys.service.UserService;
import com.keep.util.Constant;
import com.keep.util.DrawUtils;
import com.keep.util.MD5Util;
import com.keep.util.PngEncoder;

@Controller
public class FrameController {
	private static final Logger log = LoggerFactory.getLogger(FrameController.class);
	private final int PIC_WIDTH = 60;
	private final int PIC_HEIGHT = 20;

	@Autowired
	private UserService userService;



	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String login( HttpServletRequest request, Model model) {
		String account = request.getParameter("username");
		MessageBean mb = new MessageBean();
		String password = request.getParameter("password");
		String pwd = MD5Util.MD5(password);

		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.add(Calendar.MONTH, Calendar.MONTH + 1);

		User u = userService.findByUserAccount(account);
		if (null == u) {
			mb.setMsg("用户不存在!");
			return JSONObject.toJSONString(mb);
		}

		if (null != u && !pwd.equals(u.getPassword())) {
			mb.setMsg("密码不正确!");
			return JSONObject.toJSONString(mb);
		}

		String newtoken = UUID.randomUUID().toString().replace("-", "");

		if (StringUtils.isBlank(u.getToken())) { // token 为空增加token 和到期时间
			u.setToken(newtoken);
			u.setExpireTime(c.getTime());
		} else {
			if (System.currentTimeMillis() >= u.getExpireTime().getTime()) { // 如果token
																				// 时间到期更新时间
				u.setExpireTime(c.getTime());
			}
		}

		userService.update(u);

		request.getSession().setAttribute(Constant.SESSION_USER_NAME, u.getAccount());
		request.getSession().setAttribute(Constant.USER_TYPE, u.getuType());

		request.getSession().setAttribute(Constant.USER_TOKEN, u.getToken());
		mb.setFlag(true);
		mb.setData(u.getToken());
		return JSONObject.toJSONString(mb);
	}

	

	@RequestMapping(value = "/register")
	@ResponseBody
	public String register(HttpServletRequest request, Model model) {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		User u = new User();
		u.setAccount(userName);
		u.setPassword(MD5Util.MD5(password));
		u.setuType(1);
		u.setCreateTime(new Date());
		userService.save(u);
		log.info("use : " + userName + " register success !");
		MessageBean mb = new MessageBean();
		mb.setFlag(true);
		mb.setMsg("注册成功！");
		
		return JSONObject.toJSONString(mb);
	}

}
