package com.keep.sys.service;

import java.util.List;

import com.keep.entity.note.Note;

public interface NoteService extends BaseService<Note, Integer> {

	List<Note> findByStatus(int syncSize);

}
