package com.dxz.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxz.dao.CardgroupDao;
import com.dxz.mapper.CardgroupMapper;
import com.dxz.model.Cardgroup;
import com.dxz.model.ChannelToCard;
import com.dxz.vo.ChannelCardGroupData;
/**
 * DAO½Ó¿Ú²ã
 * @author lipx
 */
@Repository
public class CardgroupDaoImpl implements CardgroupDao  {

    @Autowired
	private CardgroupMapper cardgroupMapper;

	@Override
	public long countCardgroup() {
		return cardgroupMapper.countCardgroup();
	}

	@Override
	public List<Cardgroup> listCardgroupWithPage(int pageNum, int pageSize) {
		return cardgroupMapper.listCardgroupWithPage(pageNum, pageSize);
	}

	@Override
	public Cardgroup getCardgroupById(int id) {
		return cardgroupMapper.getCardgroupById(id);
	}

	@Override
	public void updateCardgroup(Cardgroup cardgroup) {
		cardgroupMapper.updateCardgroup(cardgroup);
		
	}

	@Override
	public void addCardgroup(Cardgroup cardgroup) {
		cardgroupMapper.addCardgroup(cardgroup);
	}
	
	@Override
	public List<ChannelCardGroupData> findCardgroupByChannelId(int channelId) {
		return cardgroupMapper.findCardgroupByChannelId(channelId);
	}
	
	@Override
	public List<Cardgroup> findAllCardgroupByChannelId(int channelId, int pagebegin, int pageSize) {
		return cardgroupMapper.findAllCardgroupByChannelId(channelId, pagebegin, pageSize);
	}
	
	@Override
	public long getMaxfeegroup() {
		return cardgroupMapper.getMaxfeegroup();
	}
	
	@Override
	public List<Cardgroup> findCardgroupByfeegroup(int feegroup) {
		return cardgroupMapper.findCardgroupByfeegroup(feegroup);
	}
	
	
	@Override
	public List<ChannelCardGroupData> findAllChannelAndCardgroup(int pageNum, int pageSize) {
		return cardgroupMapper.findAllChannelAndCardgroup(pageNum, pageSize);
	}
	
	@Override
	public long countAllChannelAndCardgroup() {
		return cardgroupMapper.countAllChannelAndCardgroup();
	}
	
	@Override
	public ChannelCardGroupData getChannelCardGroupDataByChannelIdAndFeegroupid(ChannelToCard channelToCard) {
		return cardgroupMapper.getChannelCardGroupDataByChannelIdAndFeegroupid(channelToCard);
	}
	
	@Override
	public void updateChannelCardGroup(ChannelCardGroupData channelCardGroupData) {
		cardgroupMapper.updateChannelCardGroup(channelCardGroupData);
	}
}
