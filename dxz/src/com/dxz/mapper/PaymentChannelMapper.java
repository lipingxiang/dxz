package com.dxz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dxz.model.ChannelToCard;
import com.dxz.model.PaymentChannel;
/**
 * Mapper”≥…‰¿‡
 * @author linbingwen
 * @time 2015.5.15
 */
public interface PaymentChannelMapper {
	public List<PaymentChannel> listPaymentChannelWithPage(@Param("pageNum")int pageNum,@Param("pageSize")int pageSize);
	public long countPaymentChannel();
	public PaymentChannel getPaymentChannelById(int id);
	public void updatePaymentChannel(PaymentChannel paymentChannel) ;
	public void addPaymentChannel(PaymentChannel paymentChannel) ;
	public PaymentChannel getPaymentChannelByOpId(String opId);
	public void  addCardGrouptoChannel(ChannelToCard channelToCard);
	public int  checkGrouptoChannelDataExists(ChannelToCard channelToCard);
}
