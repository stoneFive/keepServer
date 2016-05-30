package com.keep.entity;

import com.alibaba.fastjson.JSONObject;

/**
 * Created by tcf24 on 2016/5/7.
 */
public class MessageBean {
    private boolean flag  = false;
    private String msg ="sucesess!";

    private Object data= null;

    public MessageBean(boolean flag, String msg) {
        this.flag = flag;
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public MessageBean() {
    }public MessageBean(boolean flag) {
        this.flag = flag;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public static void main(String[] args) {
        String a = "111.txt";
        MessageBean mb = new MessageBean();

       String st =  a.substring(a.indexOf("."),a.length());

        System.out.println( " ss : " + st );
    }

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return JSONObject.toJSONString(this);
	}
    
}
