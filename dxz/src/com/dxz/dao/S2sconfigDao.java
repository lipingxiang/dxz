package com.dxz.dao;

import java.util.List;

import com.dxz.model.S2sconfig;
/**
 * DAO½Ó¿Ú²ã
 * @author lipx
 */
public interface S2sconfigDao {
	public List<S2sconfig> listS2sconfigWithPage(int pageNum,int pageSize);
	public S2sconfig  getS2sconfigById(int id);
	public long countS2sconfig();
	public void  updateS2sconfig(S2sconfig s2sconfig);
	public void  addS2sconfig(S2sconfig s2sconfig);
	public  List<S2sconfig>    findCenterS2sconfig();
	public S2sconfig  getS2sconfigByGsidAndAcode(int gsid,String cscode);
}
