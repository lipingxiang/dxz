package com.dxz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxz.model.S2sconfig;
/**
 * Mapper”≥…‰¿‡
 * @author linbingwen
 * @time 2015.5.15
 */
public interface S2sConfigMapper {
	public List<S2sconfig> listS2sconfigWithPage(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
	public long countS2sconfig();
	public S2sconfig getS2sconfigById(int id);
	public void updateS2sconfig(S2sconfig s2sconfig) ;
	public void addS2sconfig(S2sconfig s2sconfig) ;
	public List<S2sconfig>  findCenterS2sconfig() ;
	public S2sconfig getS2sconfigByGsidAndAcode(@Param("gsid")int gsid, @Param("acode")String cscode);
	
}
