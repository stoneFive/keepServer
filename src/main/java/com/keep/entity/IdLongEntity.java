package com.keep.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;



/**
 * 
 * @author lance
 * @2016年3月26日
 * @下午10:23:36
 * @TODO
 */
@MappedSuperclass  
public class IdLongEntity {

	private Integer id;
	
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO) 
	
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name="CREATE_TIME")
	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss ")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name="UPDATE_TIME")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss ")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

    
    
}
