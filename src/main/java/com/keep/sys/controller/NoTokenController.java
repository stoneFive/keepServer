package com.keep.sys.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSON;
import com.keep.entity.MessageBean;

/**
 * Created by tcf24 on 2016/5/7.
 */
@RestController

public class NoTokenController {

    @RequestMapping("/noToken")
    @ResponseBody
    @ResponseStatus(value = HttpStatus.FOUND)
    public String noToken(){

        MessageBean mb = new MessageBean();
        mb.setFlag(false);
        mb.setMsg("认证失败请重新登录");
        return JSON.toJSONString(mb);

    }
}
