package com.dxz.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dxz.dao.PaymentChannelDao;
import com.dxz.mapper.PaymentChannelMapper;
import com.dxz.model.ChannelToCard;
import com.dxz.model.PaymentChannel;
/**
 * DAO½Ó¿Ú²ã
 * @author lipx
 */
@Repository
public class PaymentChannelDaoImp implements PaymentChannelDao {

	@Autowired
	private  PaymentChannelMapper  paymentchannelmapper;
	
	@Override
	public List<PaymentChannel> listPaymentChannelWithPage(int pageNum, int pageSize) {
		return paymentchannelmapper.listPaymentChannelWithPage(pageNum, pageSize);
	}

	@Override
	public long countPaymentChannel() {
		return paymentchannelmapper.countPaymentChannel();
	}

	@Override
	public PaymentChannel getPaymentChannelById(int id) {
		return paymentchannelmapper.getPaymentChannelById(id);
	}

	@Override
	public void updatePaymentChannel(PaymentChannel paymentChannel) {
		paymentchannelmapper.updatePaymentChannel(paymentChannel);
		
	}

	@Override
	public void addPaymentChannel(PaymentChannel misoperator) {
		paymentchannelmapper.addPaymentChannel(misoperator);
	}

	@Override
	public PaymentChannel getPaymentChannel(String opId) {
		return null;
	}
	
	@Override
	public void addCardGrouptoChannel(ChannelToCard channelToCard) {
		paymentchannelmapper.addCardGrouptoChannel(channelToCard);
	}

	
	@Override
	public int checkGrouptoChannelDataExists(ChannelToCard channelToCard) {
		return paymentchannelmapper.checkGrouptoChannelDataExists(channelToCard);
	}
	
   
	
}
