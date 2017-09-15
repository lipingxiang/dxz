package com.dxz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dxz.dao.PaymentChannelDao;
import com.dxz.model.ChannelToCard;
import com.dxz.model.PaymentChannel;
import com.dxz.service.PaymentchannelService;

/**
 * DAO½Ó¿Ú²ã
 * @author linbingwen
 * @time 2015.5.15
 */
@Service("paymentchannelService")
public class PaymentchannelServiceImpl implements PaymentchannelService {
	
	
	@Autowired
	private PaymentChannelDao paymentChannelDao;

	@Override
	public long countPaymentchannelService() {
		return paymentChannelDao.countPaymentChannel();
	}

	@Override
	public List<PaymentChannel> listPaymentchannel(int pageNum, int pageSize) {
		return paymentChannelDao.listPaymentChannelWithPage(pageNum, pageSize);
	}

	@Override
	public PaymentChannel getPaymentchannelById(int id) {
		return paymentChannelDao.getPaymentChannelById(id);
	}

	@Override
	public void updatePaymentchannelService(PaymentChannel misoperator) {
		paymentChannelDao.updatePaymentChannel(misoperator);
		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW)
	public void addPaymentchannel(PaymentChannel misoperator) {
		 paymentChannelDao.addPaymentChannel(misoperator);;
	}


	@Override
	public void addCardGrouptoChannel(ChannelToCard channelToCard) {
		paymentChannelDao.addCardGrouptoChannel(channelToCard);
	}
	
	@Override
	public int checkGrouptoChannelDataExists(ChannelToCard channelToCard) {
		return paymentChannelDao.checkGrouptoChannelDataExists(channelToCard);
	}
	
	
	
}
