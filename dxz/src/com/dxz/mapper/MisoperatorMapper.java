package com.dxz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxz.model.Misoperator;
/**
 * Mapper”≥…‰¿‡
 * @author linbingwen
 * @time 2015.5.15
 */
public interface MisoperatorMapper {
	public List<Misoperator> listMisoperatorWithPage(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
	public long countMisoperator();
	public Misoperator getMisoperatorById(int id);
	public void updateMisoperator(Misoperator misoperator) ;
	public void addMisoperator(Misoperator misoperator) ;
	public Misoperator getMisoperatorByOpId(String opId);
}
