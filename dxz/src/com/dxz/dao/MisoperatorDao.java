package com.dxz.dao;

import java.util.List;

import com.dxz.model.Misoperator;
/**
 * DAO½Ó¿Ú²ã
 * @author lipx
 */
public interface MisoperatorDao {
	public List<Misoperator> listMisoperatorWithPage(int pageNum,int pageSize);
	
	public long countMisoperator();
	
	public Misoperator  getMisoperatorById(int id);
	
	public void  updateMisoperator(Misoperator misoperator);
	
	public void  addMisoperator(Misoperator misoperator);
	
	public Misoperator  getMisoperatorByOpId(String opId);
}
