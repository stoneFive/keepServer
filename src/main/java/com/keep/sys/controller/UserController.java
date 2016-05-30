package com.keep.sys.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;
import com.keep.entity.MessageBean;
import com.keep.entity.user.User;
import com.keep.sys.service.UserService;
import com.keep.util.Constant;
import com.keep.util.MD5Util;


/**
 * 
 * @author lance
 * @2016年3月26日
 * @下午10:30:53
 * @TODO
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User, Integer, UserService> {
	
   @Override
   @Autowired
   public void setEntityService(UserService userService) {
     this.entityService = userService;
    }

  
   
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String resetpwd(HttpServletRequest req, User user, Model model) {
		MessageBean mb = new MessageBean();

		String token = req.getParameter("token");
		User u = entityService.findByUseToken(token);
		if (null == u) {
			mb.setMsg("用户不存在!");

		} else {
			String newPwd = req.getParameter("newpwd");
			String tmp = MD5Util.MD5(newPwd);
			u.setPassword(tmp);
			entityService.update(u);
			mb.setFlag(true);
			mb.setMsg("更新密码成功！");
		}

		return JSONObject.toJSONString(mb);
	}

}
