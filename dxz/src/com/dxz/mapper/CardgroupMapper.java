package com.dxz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxz.model.Cardgroup;
import com.dxz.model.ChannelToCard;
import com.dxz.vo.ChannelCardGroupData;
/**
 * Mapper”≥…‰¿‡
 * @author linbingwen
 * @time 2015.5.15
 */
public interface CardgroupMapper {
	
	public long  countCardgroup();
	
	public List<Cardgroup> listCardgroupWithPage(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
	
	public Cardgroup  getCardgroupById(@Param("payid")int payid);
	
	public void  updateCardgroup(Cardgroup cardgroup);
	
	public void  addCardgroup(Cardgroup cardgroup);
	
	public List<ChannelCardGroupData> findCardgroupByChannelId(@Param("channelId")int channelId);
	
	public List<Cardgroup> findAllCardgroupByChannelId(@Param("channelId")int channelId,@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
	
	public long  getMaxfeegroup();
	
	public List<Cardgroup> findCardgroupByfeegroup(@Param("feegroup")int feegroup);
	
	
	public List<ChannelCardGroupData> findAllChannelAndCardgroup(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
	
	public long countAllChannelAndCardgroup();
	
	public ChannelCardGroupData getChannelCardGroupDataByChannelIdAndFeegroupid(ChannelToCard channelToCard);
	
	public void  updateChannelCardGroup(ChannelCardGroupData channelCardGroupData);
	
	
}
