package com.keep.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keep.entity.user.User;
import com.keep.sys.repository.UserRepository;
import com.keep.sys.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User, Integer, UserRepository>
		implements UserService {

	

	@Override
	public User findByUserAccount(String account) {
		return repository.findByAccount(account);
	}

	@Autowired
	@Override
	public void setEntityRepository(UserRepository userRepository ) {
	this.repository = userRepository;
		
	}

	@Override
	public User findByUseToken(String token) {
		// TODO Auto-generated method stub
		return repository.findByToken(token);
	}

	

	

}
