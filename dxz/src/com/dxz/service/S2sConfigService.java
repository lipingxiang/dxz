package com.dxz.service;

import java.util.List;

import com.dxz.model.S2sconfig;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
public interface S2sConfigService {
	
	public long  countS2sConfig();
	
	public List<S2sconfig> listS2sconfigPage(int pageNum,int pageSize);
	
	public S2sconfig  getS2sconfigById(int id);
	
	public void  updateS2sconfig(S2sconfig misoperator);
	
	public void  addS2sconfig(S2sconfig misoperator);
	
	public  List<S2sconfig>  findCenterS2sconfig();
	
	public S2sconfig  getS2sconfigByGsidAndAcode(int gsid,String cscode);
	
}
