package com.keep.entity.Tag;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.keep.entity.IdLongEntity;
import com.keep.entity.note.Note;

@Entity
@Table(name = "T_TAG")
public class Tag  extends IdLongEntity{

	private String title;
   
    private List<Note> notes;
    
    private int status ; //0 正常 1 删除
    
    public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	 @ManyToMany(fetch = FetchType.EAGER)
	    @JoinTable(name = "TAGS_NOTES",
	            joinColumns = @JoinColumn(name = "TAG_ID", nullable = false),
	            inverseJoinColumns = @JoinColumn(name = "NOTE_ID", nullable = false))
	public List<Note> getNotes() {
		return notes;
	}

	public void setNotes(List<Note> notes) {
		this.notes = notes;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
