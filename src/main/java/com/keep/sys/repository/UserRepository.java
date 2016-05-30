package com.keep.sys.repository;

import com.keep.entity.user.User;

public interface UserRepository extends BaseRepository<User, Integer> {
	public User findByAccount(String account);

	public User findByToken(String token);
}
