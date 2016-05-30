package com.keep.sys.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.keep.entity.MessageBean;
import com.keep.entity.Tag.Tag;
import com.keep.entity.note.Note;
import com.keep.entity.user.User;
import com.keep.sys.service.NoteService;
import com.keep.sys.service.UserService;

/**
 * Created by tcf24 on 2016/5/7.
 */
@RestController
@RequestMapping("/note")
public class NoteController extends BaseController<Note, Integer, NoteService> {
	@Override
	public void setEntityService(NoteService entityService) {
		// TODO Auto-generated method stub
		this.entityService = noteService;
	}
    @Autowired
    public NoteService noteService;
    @Autowired
    private UserService userService;
    
    
    @RequestMapping("/list")
    public String listAllNote(@RequestParam("token") String token){
    	 User  u =userService.findByUseToken(token);
    	Map<String ,Object> param = Maps.newHashMap();
    	param.put("EQI_status", 0);
    	param.put("EQI_user.id", u.getId());
       
        List<Note> notes = noteService.find(param);
       // Set<Note> lists = u.getNotes();
        MessageBean mb = new MessageBean();
        mb.setFlag(true);
        mb.setData(notes);
        return JSON.toJSONString(mb);

    }
    @RequestMapping("/view/{id}")
    public String view (@PathVariable("id") int id){
        Note  note = noteService.get(id);
        return JSON.toJSONString(note);
    }

    @RequestMapping("/del/{id}")
    public  String del(@PathVariable("id") int id){
    	Calendar c = Calendar.getInstance();
    	c.setTime(new  Date());
    	c.add(Calendar.MONTH, Calendar.MONTH+1);
        Note note = noteService.get(id);
        
        note.setStatus(1);
        note.setUpdateTime(c.getTime());
       
        MessageBean mb = new MessageBean();
        mb.setFlag(true);
        noteService.update(note);
        return JSON.toJSONString(mb);
    }

    @RequestMapping("/edit/{id}")
    public  String edit(HttpServletRequest req , @PathVariable("id")int id){
    	 Note note = noteService.get(id);
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String c = req.getParameter("color");
        int color = 1;
        if(StringUtils.isNotBlank(c)){
        	 color = Integer.parseInt(c);
        	 note.setColor(color);
        }
        if(StringUtils.isNotBlank(content)){
        	note.setContent(content);
        }
        if(StringUtils.isNotBlank(title)){
        	note.setTitle(title);
        }
       
        System.out.println("note : " + note.toString());
        note.setUpdateTime(new Date());
        noteService.update(note);

        MessageBean mb = new MessageBean();
        mb.setFlag(true);

        return JSON.toJSONString(mb);

    }
    @RequestMapping("/add")
    public  String  add( HttpServletRequest request){
    	  MessageBean mb = new MessageBean();
    	Note note = new Note();
        String token  = request.getParameter("token");
        String title = request.getParameter("title");
		String content = request.getParameter("content");
		String color = request.getParameter("color");
		String tags = request.getParameter("tags");
		
		
		if(StringUtils.isBlank(title) || StringUtils.isBlank(color) || StringUtils.isBlank(content)){
			
			mb.setMsg("请填写正确的笔记!");
			return JSONObject.toJSONString(mb);
		}
        User u = userService.findByUseToken(token);

       /* if(!file.isEmpty()){
        	String filePath = request.getSession().getServletContext().getRealPath("/noteFile");


            File dirFile = new File(filePath);
            if(!dirFile.exists()){
                dirFile.mkdir();
                System.out.println("dirFile path : " + dirFile.getPath());
            }

            String fileName = file.getOriginalFilename();

            System.out.println( "fileName : " + fileName);
            String newFileName = System.currentTimeMillis()
                                +fileName.substring(fileName.indexOf("."),fileName.length());
            note.setPic("noteFile/"+newFileName);
            try {
                file.transferTo(new File(dirFile+"/"+newFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }*/
        
		if(StringUtils.isNotBlank(tags)){
			List<Tag> tg = Lists.newArrayList();
			List<String> allTag = Splitter.on(":").splitToList(tags);
			for (String i : allTag){
				System.out.println("tag id : " + i);
				
				Tag t = new Tag();
				t.setId(Integer.parseInt(i));
				tg.add(t);
			}
			note.setTags(tg);
		}
		 note.setUpdateTime(new Date());
        note.setCreateTime(new Date());
        note.setColor(Integer.parseInt(color));
        note.setUser(u);
        note.setStatus(0);
        note.setContent(content);
        note.setTitle(title);
        noteService.save(note);
      
                mb.setFlag(true);
        return JSON.toJSONString(mb);
    }
	
}
