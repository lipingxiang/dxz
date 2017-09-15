package com.dxz.dao;

import com.dxz.model.Misoperator;
import com.dxz.model.User;
/**
 * DAO接口层
 * @author lipx
 */
public interface UserDao {
	/**
	 * 根据用户ID查询用户信息
	 * @param id
	 * @return
	 */
	public User findUserById(int id);
	
	public Misoperator getMisoperatorByName(String userName);
}
