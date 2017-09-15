package com.dxz.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import  com.dxz.mapper.UserMapper;
import com.dxz.model.Misoperator;
import com.dxz.model.User;
/**
 * DAO µœ÷≤„
 * @author lipx
 */
@Repository
public class UserDaoImpl implements UserDao{
    @Autowired
	private UserMapper userMapper;
	@Override
	public User findUserById(int id) {
		User user = userMapper.selectUserById(id);
		 return user; 
	}
	
	
	@Override
	public Misoperator getMisoperatorByName(String userName) {
		return userMapper.getMisoperatorByName(userName);
	}
	
}
