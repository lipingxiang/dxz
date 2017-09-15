package com.dxz.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxz.dao.S2sconfigDao;
import com.dxz.mapper.S2sConfigMapper;
import com.dxz.model.S2sconfig;
@Repository
public class S2sconfigDaoImpl implements S2sconfigDao {
	
	
    @Autowired
	private S2sConfigMapper s2sConfigMapper;

	@Override
	public List<S2sconfig> listS2sconfigWithPage(int pageNum, int pageSize) {
		return s2sConfigMapper.listS2sconfigWithPage(pageNum, pageSize);
	}

	@Override
	public S2sconfig getS2sconfigById(int id) {
		return s2sConfigMapper.getS2sconfigById(id);
	}

	@Override
	public long countS2sconfig() {
		return s2sConfigMapper.countS2sconfig();
	}

	@Override
	public void updateS2sconfig(S2sconfig s2sconfig) {
		s2sConfigMapper.updateS2sconfig(s2sconfig);
		
	}

	@Override
	public void addS2sconfig(S2sconfig s2sconfig) {
		s2sConfigMapper.addS2sconfig(s2sconfig);
		
	}

	
	@Override
	public  List<S2sconfig>  findCenterS2sconfig() {
		return s2sConfigMapper.findCenterS2sconfig();
	}
	
	@Override
	public S2sconfig getS2sconfigByGsidAndAcode(int gsid, String cscode) {
		return s2sConfigMapper.getS2sconfigByGsidAndAcode(gsid, cscode);
	}
}
