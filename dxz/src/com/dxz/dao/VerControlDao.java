package com.dxz.dao;

import java.util.List;

import com.dxz.model.Vercontrol;
/**
 * DAO½Ó¿Ú²ã
 * @author lipx
 */
public interface VerControlDao {
	public List<Vercontrol> listVerConWithPage(int pageNum,int pageSize);
	
	public Vercontrol  getVercontrolById(int id);
	
	public long countVerCon();
	
	public void  updateVercontrol(Vercontrol vercontrol);
	public void  addVercontrol(Vercontrol vercontrol);
}
