package com.keep.sys.service;

import com.keep.entity.user.User;

/**
 * 
 * @author lance
 * @2016年3月26日
 * @下午10:32:00
 * @TODO
 */
public interface UserService extends BaseService<User, Integer> {
	public User findByUserAccount(String account);
	
	public User findByUseToken(String token);
}
