package com.dxz.dao;

import java.util.List;

import com.dxz.model.v2gameserverinfo;

/**
 * DAO½Ó¿Ú²ã
 * @author lipx
 */
public interface GameServerinfoDao {
	public List<v2gameserverinfo> listGameserverinfoWithPage(int pageNum,int pageSize);
	public v2gameserverinfo  getGameserverinfoById(int id);
	public long countGameserverinfo();
	public void  updateGameserverinfo(v2gameserverinfo s2sconfig);
	public int  addGameserverinfo(v2gameserverinfo s2sconfig);
}
