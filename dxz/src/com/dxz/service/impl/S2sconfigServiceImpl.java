package com.dxz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxz.dao.S2sconfigDao;
import com.dxz.model.S2sconfig;
import com.dxz.service.S2sConfigService;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
@Service("S2sconfigServiceImpl")
public class S2sconfigServiceImpl implements S2sConfigService{
	
	@Autowired
	private S2sconfigDao  s2sconfigDao;

	@Override
	public long countS2sConfig() {
		return s2sconfigDao.countS2sconfig();
	}

	@Override
	public List<S2sconfig> listS2sconfigPage(int pageNum, int pageSize) {
		return s2sconfigDao.listS2sconfigWithPage(pageNum, pageSize);
	}

	@Override
	public S2sconfig getS2sconfigById(int id) {
		return s2sconfigDao.getS2sconfigById(id);
	}

	@Override
	public void updateS2sconfig(S2sconfig s2sconfig) {
		s2sconfigDao.updateS2sconfig(s2sconfig);
		
	}

	@Override
	public void addS2sconfig(S2sconfig s2sconfig) {
		s2sconfigDao.addS2sconfig(s2sconfig);
	}
	
	@Override
	public List<S2sconfig> findCenterS2sconfig() {
		return s2sconfigDao.findCenterS2sconfig();
	}
	
	@Override
	public S2sconfig getS2sconfigByGsidAndAcode(int gsid, String cscode) {
		return s2sconfigDao.getS2sconfigByGsidAndAcode(gsid, cscode);
	}
}
