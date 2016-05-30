package com.keep.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keep.entity.Tag.Tag;
import com.keep.sys.repository.TagRepository;
import com.keep.sys.service.TagService;
@Service("tagService")
public class TagServiceImpl extends BaseServiceImpl<Tag, Integer, TagRepository> implements TagService {

	@Autowired
	@Override
	public void setEntityRepository(TagRepository repository) {
		// TODO Auto-generated method stub
		this.repository = repository;
	}

}
