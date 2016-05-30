package com.keep.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.keep.entity.note.Note;
import com.keep.sys.repository.NoteRepository;
import com.keep.sys.service.NoteService;

@Service("noteService")
public class NoteServiceImpl extends BaseServiceImpl<Note, Integer, NoteRepository>  implements NoteService{

	@Autowired
	@Override
	public void setEntityRepository(NoteRepository repository) {
		// TODO Auto-generated method stub
		this.repository = repository;
		
	}

	@Override
	public List<Note> findByStatus(int syncSize) {
		
		return null;
	}

}
