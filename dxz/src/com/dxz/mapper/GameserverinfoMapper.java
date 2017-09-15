package com.dxz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxz.model.v2gameserverinfo;
/**
 * Mapper”≥…‰¿‡
 * @author linbingwen
 * @time 2015.5.15
 */
public interface GameserverinfoMapper {
	public List<v2gameserverinfo> listGameserverinfoWithPage(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
	public long countGameserverinfo();
	public v2gameserverinfo getGameserverinfoById(int id);
	public void updateGameserverinfo(v2gameserverinfo s2sconfig) ;
	public int addGameserverinfo(v2gameserverinfo s2sconfig) ;
}
