package com.keep.sys.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.MBeanAttributeInfo;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Splitter;
import com.keep.entity.MessageBean;
import com.keep.entity.Tag.Tag;
import com.keep.entity.note.Note;
import com.keep.sys.service.TagService;

@Controller
@RequestMapping("/tag")
public class TagController extends BaseController<Tag, Integer, TagService> {

	@Autowired
	private TagService tagService;
	@Override
	public void setEntityService(TagService tagService) {
		// TODO Auto-generated method stub
		this.entityService = tagService;
		
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest req){
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("EQI_status", 0);
		List<Tag> tags = tagService.find(param);
		MessageBean mb = new MessageBean();
		mb.setFlag(true);
		mb.setData(tags);
		return JSONObject.toJSONString(mb);
	
	}
	@RequestMapping("/add")
	public String save (HttpServletRequest req){
		
		String title = req.getParameter("title");
		String nids = req.getParameter("nids"); // note id
		
		
		
		List<Note> notes = new ArrayList<Note>();
		if (StringUtils.isNotBlank(nids)) {
			List<String> nid = Splitter.on(":").splitToList(nids);
			for (String i : nid) {
				Note n = new Note();
				n.setId(Integer.parseInt(i));
				notes.add(n);
			}
		}
		
		Tag t = new Tag();
		t.setTitle(title);
		t.setCreateTime(new Date());
		t.setStatus(0);
		t.setNotes(notes);
		tagService.save(t);
		MessageBean mb = new MessageBean();
		mb.setFlag(true);
		mb.setMsg("标签添加成功!");
		return JSONObject.toJSONString(mb);
	}

}
