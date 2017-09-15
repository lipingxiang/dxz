package com.dxz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxz.dao.GameServerinfoDao;
import com.dxz.model.v2gameserverinfo;
import com.dxz.service.GameserverinfoService;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
@Service
public class GameserverinfoServiceImpl implements GameserverinfoService{
	
	@Autowired
	private GameServerinfoDao  gameServerinfoDao;

	@Override
	public long countGameserverinfo() {
		return gameServerinfoDao.countGameserverinfo();
	}

	@Override
	public List<v2gameserverinfo> listGameserverinfoPage(int pageNum, int pageSize) {
		return gameServerinfoDao.listGameserverinfoWithPage(pageNum, pageSize);
	}

	@Override
	public v2gameserverinfo getGameserverinfoById(int id) {
		return gameServerinfoDao.getGameserverinfoById(id);
	}

	@Override
	public void updateGameserverinfo(v2gameserverinfo v2gameserverinfo) {
		gameServerinfoDao.updateGameserverinfo(v2gameserverinfo);
		
	}

	@Override
	public int addGameserverinfo(v2gameserverinfo v2gameserverinfo) {
		return gameServerinfoDao.addGameserverinfo(v2gameserverinfo);
	}

	
	
}
