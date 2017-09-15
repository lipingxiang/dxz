package com.dxz.service;

import java.util.List;

import com.dxz.model.ChannelToCard;
import com.dxz.model.PaymentChannel;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
public interface PaymentchannelService {
	
	public long  countPaymentchannelService();
	
	public List<PaymentChannel> listPaymentchannel(int pageNum,int pageSize);
	
	public PaymentChannel  getPaymentchannelById(int id);
	
	public void  updatePaymentchannelService(PaymentChannel misoperator);
	
	public void  addPaymentchannel(PaymentChannel misoperator);
	
	public void  addCardGrouptoChannel(ChannelToCard channelToCard);
	
	public int  checkGrouptoChannelDataExists(ChannelToCard channelToCard);
	
}
