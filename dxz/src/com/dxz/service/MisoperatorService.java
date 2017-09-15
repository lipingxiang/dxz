package com.dxz.service;

import java.util.List;

import com.dxz.model.Misoperator;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
public interface MisoperatorService {
	
	public long  countMisoperator();
	
	public List<Misoperator> listMisoperatorPage(int pageNum,int pageSize);
	
	public Misoperator  getMisoperatorById(int id);
	
	public void  updateMisoperator(Misoperator misoperator);
	
	public void  addMisoperator(Misoperator misoperator);
	
	public Misoperator  getMisoperatorByOpId(String opId);
	
}
