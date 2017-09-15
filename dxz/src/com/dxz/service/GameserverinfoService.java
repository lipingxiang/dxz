package com.dxz.service;

import java.util.List;

import com.dxz.model.v2gameserverinfo;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
public interface GameserverinfoService {
	
	public long  countGameserverinfo();
	
	public List<v2gameserverinfo> listGameserverinfoPage(int pageNum,int pageSize);
	
	public v2gameserverinfo  getGameserverinfoById(int id);
	
	public void  updateGameserverinfo(v2gameserverinfo misoperator);
	
	public int  addGameserverinfo(v2gameserverinfo misoperator);
	
}
