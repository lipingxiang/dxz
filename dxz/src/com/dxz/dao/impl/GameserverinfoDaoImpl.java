package com.dxz.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxz.dao.GameServerinfoDao;
import com.dxz.mapper.GameserverinfoMapper;
import com.dxz.model.S2sconfig;
import com.dxz.model.v2gameserverinfo;
@Repository
public class GameserverinfoDaoImpl implements GameServerinfoDao {
	
	
    @Autowired
	private GameserverinfoMapper s2sConfigMapper;

	@Override
	public List<v2gameserverinfo> listGameserverinfoWithPage(int pageNum, int pageSize) {
		return s2sConfigMapper.listGameserverinfoWithPage(pageNum, pageSize);
	}

	@Override
	public v2gameserverinfo getGameserverinfoById(int id) {
		return s2sConfigMapper.getGameserverinfoById(id);
	}

	@Override
	public long countGameserverinfo() {
		return s2sConfigMapper.countGameserverinfo();
	}

	@Override
	public void updateGameserverinfo(v2gameserverinfo gameserverinfo) {
		s2sConfigMapper.updateGameserverinfo(gameserverinfo);
		
	}

	@Override
	public int addGameserverinfo(v2gameserverinfo gameserverinfo) {
		return s2sConfigMapper.addGameserverinfo(gameserverinfo);
		
	}
	

}
