package com.dxz.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxz.dao.MisoperatorDao;
import com.dxz.mapper.MisoperatorMapper;
import com.dxz.model.Misoperator;
/**
 * DAO½Ó¿Ú²ã
 * @author lipx
 */
@Repository
public class MisoperatorDaoImpl implements MisoperatorDao {

    @Autowired
	private MisoperatorMapper misoperatoMapper;
	
	@Override
	public List<Misoperator> listMisoperatorWithPage(int pageNum, int pageSize) {
		return misoperatoMapper.listMisoperatorWithPage(pageNum, pageSize);
	}

	@Override
	public long countMisoperator() {
		return misoperatoMapper.countMisoperator();
	}
	
	
	@Override
	public Misoperator getMisoperatorById(int id) {
		return misoperatoMapper.getMisoperatorById(id);
	}
	
	@Override
	public void updateMisoperator(Misoperator misoperator) {
		misoperatoMapper.updateMisoperator(misoperator);
	}
	
	@Override
	public void addMisoperator(Misoperator misoperator) {
		misoperatoMapper.addMisoperator(misoperator);
	}
	
	@Override
	public Misoperator getMisoperatorByOpId(String opId) {
		return misoperatoMapper.getMisoperatorByOpId(opId);
	}
	
}
