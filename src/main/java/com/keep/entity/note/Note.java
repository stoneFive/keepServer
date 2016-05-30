package com.keep.entity.note;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.keep.entity.IdLongEntity;
import com.keep.entity.Tag.Tag;
import com.keep.entity.user.User;

@Entity
@Table(name ="T_NOTE")
public class Note extends IdLongEntity {
	
	 	private String title;
	    private String content;
	    private int color;
	    private String pic;
	    private int status; // 0 正常  1删除
	   
	    private List<Tag> tags;
	    
	    private User user;

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public int getColor() {
			return color;
		}

		public void setColor(int color) {
			this.color = color;
		}

		public String getPic() {
			return pic;
		}

		public void setPic(String pic) {
			this.pic = pic;
		}

		public int getStatus() {
			return status;
		}

		public void setStatus(int status) {
			this.status = status;
		}

		
		 @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH},fetch = FetchType.LAZY)
		@JoinColumn(name = "uid")
		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
		@ManyToMany(mappedBy="notes")
		public List<Tag> getTags() {
			return tags;
		}

		public void setTags(List<Tag> tags) {
			this.tags = tags;
		}

		@Override
		public String toString() {
			return "Note [title=" + title + ", content=" + content + ", color=" + color + ", pic=" + pic + ", status="
					+ status + ", tags=" + tags + ", user=" + user + "]";
		}
		
}
