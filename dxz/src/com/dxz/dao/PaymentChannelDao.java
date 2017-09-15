package com.dxz.dao;

import java.util.List;

import com.dxz.model.ChannelToCard;
import com.dxz.model.PaymentChannel;
/**
 * DAO½Ó¿Ú²ã
 * @author lipx
 */
public interface PaymentChannelDao {
	
	
	public List<PaymentChannel> listPaymentChannelWithPage(int pageNum,int pageSize);
	
	public long countPaymentChannel();
	
	public PaymentChannel  getPaymentChannelById(int id);
	
	public void  updatePaymentChannel(PaymentChannel misoperator);
	
	public void  addPaymentChannel(PaymentChannel misoperator);
	
	public PaymentChannel  getPaymentChannel(String opId);
	
	public void  addCardGrouptoChannel(ChannelToCard channelToCard);
	
	public int  checkGrouptoChannelDataExists(ChannelToCard channelToCard);
}
