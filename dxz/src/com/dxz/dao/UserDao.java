package com.dxz.dao;

import com.dxz.model.Misoperator;
import com.dxz.model.User;
/**
 * DAO�ӿڲ�
 * @author lipx
 */
public interface UserDao {
	/**
	 * �����û�ID��ѯ�û���Ϣ
	 * @param id
	 * @return
	 */
	public User findUserById(int id);
	
	public Misoperator getMisoperatorByName(String userName);
}
