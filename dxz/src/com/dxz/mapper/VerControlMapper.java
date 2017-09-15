package com.dxz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxz.model.Vercontrol;
/**
 * Mapper”≥…‰¿‡
 * @author linbingwen
 * @time 2015.5.15
 */
public interface VerControlMapper {
	public List<Vercontrol> listVerConWithPage(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
	public long countVercontrol();
	public Vercontrol getVercontrolById(int id);
	public void updateVercontrol(Vercontrol vercontrol) ;
	public void addVercontrol(Vercontrol vercontrol) ;
}
