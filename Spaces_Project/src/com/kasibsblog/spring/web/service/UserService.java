package com.kasibsblog.spring.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kasibsblog.spring.web.daos.User;
import com.kasibsblog.spring.web.daos.UserDao;

@Component("userservice")
public class UserService {
	
	@Autowired
	private UserDao userdao;
	
	public void createUser(User user){
		userdao.createUser(user);
	}
	
	public boolean userExists(String username){
		return userdao.userExists(username);
	}
}
