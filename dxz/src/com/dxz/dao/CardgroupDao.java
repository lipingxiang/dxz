package com.dxz.dao;

import java.util.List;

import com.dxz.model.Cardgroup;
import com.dxz.model.ChannelToCard;
import com.dxz.vo.ChannelCardGroupData;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
public interface CardgroupDao {
	
	public long  countCardgroup();
	
	public List<Cardgroup> listCardgroupWithPage(int pageNum,int pageSize);
	
	public Cardgroup  getCardgroupById(int id);
	
	public void  updateCardgroup(Cardgroup cardgroup);
	
	public void  addCardgroup(Cardgroup cardgroup);
	
	public List<ChannelCardGroupData> findCardgroupByChannelId(int channelId);
	
	public List<Cardgroup> findAllCardgroupByChannelId(int channelId,int pagebegin,int pageSize);
	
	public long  getMaxfeegroup();
	
	public List<Cardgroup> findCardgroupByfeegroup(int feegroup);
	
	public List<ChannelCardGroupData> findAllChannelAndCardgroup(int pageNum,int pageSize);
	
	public long countAllChannelAndCardgroup();
	
	
	public ChannelCardGroupData getChannelCardGroupDataByChannelIdAndFeegroupid(ChannelToCard channelToCard);
	
	public void  updateChannelCardGroup(ChannelCardGroupData channelCardGroupData);
	
}
