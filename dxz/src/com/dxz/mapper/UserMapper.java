package com.dxz.mapper;

import com.dxz.model.Misoperator;
import com.dxz.model.User;
/**
 * Mapperӳ����
 * @author linbingwen
 * @time 2015.5.15
 */
public interface UserMapper {
	public User selectUserById(int userId);
	public Misoperator getMisoperatorByName(String userName);
}
