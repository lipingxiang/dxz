package com.dxz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxz.dao.MisoperatorDao;
import com.dxz.model.Misoperator;
import com.dxz.service.MisoperatorService;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
@Service("misoperatorService")
public class MisoperatorServiceImpl implements MisoperatorService {
	
	
	@Autowired
	private MisoperatorDao misoperatorDao;
	
	
	@Override
	public long countMisoperator() {
		
		return misoperatorDao.countMisoperator();
	}
	
	@Override
	public List<Misoperator> listMisoperatorPage(int pageNum, int pageSize) {
		return misoperatorDao.listMisoperatorWithPage(pageNum, pageSize);
	}
	
	@Override
	public Misoperator getMisoperatorById(int id) {
		return misoperatorDao.getMisoperatorById(id);
	}
	
	@Override
	public void updateMisoperator(Misoperator misoperator) {
		misoperatorDao.updateMisoperator(misoperator);
	}
	
	@Override
	public void addMisoperator(Misoperator misoperator) {
		misoperatorDao.addMisoperator(misoperator);
	}
	
	@Override
	public Misoperator getMisoperatorByOpId(String opId) {
		return misoperatorDao.getMisoperatorByOpId(opId);
	}
	
	
	
}
