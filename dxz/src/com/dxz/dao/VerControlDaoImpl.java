package com.dxz.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxz.mapper.VerControlMapper;
import com.dxz.model.Vercontrol;
/**
 * DAO µœ÷≤„
 * @author lipx
 */
@Repository
public class VerControlDaoImpl implements VerControlDao{
    @Autowired
	private VerControlMapper verControlMapper;


	@Override
	public List<Vercontrol> listVerConWithPage(int pageNum,int pageSize) {
		return verControlMapper.listVerConWithPage(pageNum, pageSize);
	}
	
	
	@Override
	public long countVerCon() {
		return verControlMapper.countVercontrol();
	}


	@Override
	public Vercontrol getVercontrolById(int id) {
		return verControlMapper.getVercontrolById(id);
	}
	
	@Override
	public void updateVercontrol(Vercontrol vercontrol) {
		verControlMapper.updateVercontrol(vercontrol);
	}
	
	@Override
	public void addVercontrol(Vercontrol vercontrol) {
		verControlMapper.addVercontrol(vercontrol);
	}
}
