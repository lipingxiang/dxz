package com.dxz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dxz.dao.CardgroupDao;
import com.dxz.model.Cardgroup;
import com.dxz.model.ChannelToCard;
import com.dxz.service.CardgroupService;
import com.dxz.vo.CardgroupData;
import com.dxz.vo.ChannelCardGroupData;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
@Service("cardgroupService")
public class CardgroupServiceImpl implements CardgroupService {
	
	
	@Autowired
	private CardgroupDao cardgroupDao;
	

	@Override
	public long countCardgroup() {
		return cardgroupDao.countCardgroup();
	}

	@Override
	public List<Cardgroup> listCardgroupWithPage(int pageNum, int pageSize) {
		return cardgroupDao.listCardgroupWithPage(pageNum, pageSize);
	}

	@Override
	public Cardgroup getCardgrouprById(int id) {
		return cardgroupDao.getCardgroupById(id);
	}

	@Override
	public void updateCardgroup(Cardgroup misoperator) {
		cardgroupDao.updateCardgroup(misoperator);
		
	}

	@Override
	public void addCardgroup(Cardgroup misoperator) {
		cardgroupDao.addCardgroup(misoperator);
	}
	
	
	@Override
	public List<ChannelCardGroupData> findCardgroupByChannelId(int channelId) {
		return cardgroupDao.findCardgroupByChannelId(channelId);
	}
	
	
	@Override
	public List<Cardgroup> findAllCardgroupByChannelId(int channelId, int pagebegin, int pageSize) {
		return cardgroupDao.findAllCardgroupByChannelId(channelId, pagebegin, pageSize);
	}
	
	@Override
	public long getMaxfeegroup() {
		return cardgroupDao.getMaxfeegroup();
	}
	
	@Override
	public List<Cardgroup> findCardgroupByfeegroup(int feegroup) {
		return cardgroupDao.findCardgroupByfeegroup(feegroup);
	}
	
	
	@Override
	public List<ChannelCardGroupData> findAllChannelAndCardgroup(int pageNum, int pageSize) {
		return cardgroupDao.findAllChannelAndCardgroup(pageNum, pageSize);
	}
	
	@Override
	public long countAllChannelAndCardgroup() {
		return cardgroupDao.countAllChannelAndCardgroup();
	}
	
	@Override
	public ChannelCardGroupData getChannelCardGroupDataByChannelIdAndFeegroupid(ChannelToCard channelToCard) {
		return cardgroupDao.getChannelCardGroupDataByChannelIdAndFeegroupid(channelToCard);
	}
	
	@Override
	public void updateChannelCardGroup(ChannelCardGroupData channelCardGroupData) {
		cardgroupDao.updateChannelCardGroup(channelCardGroupData);
	}
	
	
}
