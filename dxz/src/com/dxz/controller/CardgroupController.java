package com.dxz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dxz.constant.CommonConstant;
import com.dxz.model.Cardgroup;
import com.dxz.model.ChannelToCard;
import com.dxz.model.Misoperator;
import com.dxz.model.PaymentChannel;
import com.dxz.service.CardgroupService;
import com.dxz.service.MisoperatorService;
import com.dxz.service.PaymentchannelService;
import com.dxz.vo.CardgroupData;
import com.dxz.vo.CardgroupSubmitVo;
import com.dxz.vo.ChannelCardGroupData;

@Controller
public class CardgroupController {
	
	
	@Autowired
	private MisoperatorService misoperatorService;
	

	@Autowired
	private PaymentchannelService paymentchannelService;
	

	@Autowired
	private CardgroupService cardgroupService;
	
	
	@RequestMapping(value="/getCardgroupList",method = RequestMethod.GET)
	public String getPaymentchannelList(ModelMap map,HttpServletRequest request,@RequestParam(value = "pageNum") int pageNum,@RequestParam(value = "opId",required=false) String opId){
		
		if(!StringUtils.isEmpty(opId)){
			
			Misoperator misoperator = 	misoperatorService.getMisoperatorByOpId(opId);
			
			if(misoperator != null) {
				request.getSession().setAttribute("opLevel",misoperator.getOpLevel());
			}
		}
		
		
		
		
		
		String opLevel = (String) request.getSession().getAttribute("opLevel");
		
		if("55".equals(opLevel) || "99".equals(opLevel)) {
//			List<S2sconfig>  s2sconfigList = S2sConfigService.listS2sconfigPage((pageNum-1)*CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE);
//			paymentchannelService.l
//			List<PaymentChannel> 	paymentChannelList =  paymentchannelService.listPaymentchannel((pageNum-1)*CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE);
//			map.put("paymentChannelList", paymentChannelList);
			
			List<Cardgroup>  cardgroupList = cardgroupService.listCardgroupWithPage((pageNum-1)*CommonConstant.PAGE_SIZE_CARDGROUP, CommonConstant.PAGE_SIZE_CARDGROUP);
			map.put("cardgroupList", cardgroupList);
		}
		
		long cnt = paymentchannelService.countPaymentchannelService();
		if(pageNum*CommonConstant.PAGE_SIZE_CARDGROUP>=cnt) {
			map.put("lastPage", 1);
		}else {
			map.put("lastPage", 0);
		}
		
		map.put("pageNum", pageNum);
		map.put("opLevel", opLevel);
		return "cardGroupList";
	}
	
	
	@RequestMapping(value="/toAddCardgroup",method = RequestMethod.GET)
	public String toAddVercontrol(ModelMap map,HttpServletRequest request){	
		return "addCardgroup";
	}	
	
	@RequestMapping(value="/addCardgroup",method = RequestMethod.POST)
	public String addCardgroup(ModelMap map,HttpServletRequest request,@ModelAttribute CardgroupSubmitVo cardgroupSubmitVo){	
		List<CardgroupData> cardgroupDataList =  cardgroupSubmitVo.getCardgroups();
		
		
		long maxfee = cardgroupService.getMaxfeegroup();
		for(CardgroupData cardgroupdata :cardgroupDataList) {
			Cardgroup cardgroup = new Cardgroup();
			cardgroup.setClientid(cardgroupSubmitVo.getClientId());
			cardgroup.setCode(cardgroupSubmitVo.getCode());
			cardgroup.setEnable(cardgroupSubmitVo.getEnable());
			// 高并发存在风险
			cardgroup.setFeegroup(Long.valueOf(maxfee).intValue() +1);
			cardgroup.setRoomcard(cardgroupdata.getRoomCard());
			cardgroup.setGiftcard(cardgroupdata.getGiftCard());
			cardgroup.setMoney(cardgroupdata.getMoney());
			cardgroup.setSdesc(cardgroupSubmitVo.getSdesc());
			cardgroupService.addCardgroup(cardgroup);
		}
		
		return "redirect:getCardgroupList?pageNum=1";
	}	
	
	
	@RequestMapping(value="/updateCardgroup",method = RequestMethod.POST)
	public String updateCardgroup(ModelMap map,HttpServletRequest request,@ModelAttribute CardgroupSubmitVo cardgroupSubmitVo){	
		List<CardgroupData> cardgroupDataList =  cardgroupSubmitVo.getCardgroups();
		for(CardgroupData cardgroupdata :cardgroupDataList) {
			Cardgroup cardgroup = cardgroupService.getCardgrouprById(cardgroupdata.getPayid());
//			Cardgroup cardgroup = new Cardgroup();
			cardgroup.setClientid(cardgroupSubmitVo.getClientId());
			cardgroup.setCode(cardgroupSubmitVo.getCode());
			cardgroup.setEnable(cardgroupSubmitVo.getEnable());
			// 高并发存在风险
//			cardgroup.setFeegroup(Long.valueOf(maxfee).intValue() +1);
			cardgroup.setRoomcard(cardgroupdata.getRoomCard());
			cardgroup.setGiftcard(cardgroupdata.getGiftCard());
			cardgroup.setMoney(cardgroupdata.getMoney());
			cardgroup.setSdesc(cardgroupSubmitVo.getSdesc());
			cardgroupService.updateCardgroup(cardgroup);
		}
		
		return "redirect:getCardgroupList?pageNum=1";
	}	
	
	@RequestMapping(value="/toUpdateCardgroup",method = RequestMethod.GET)
	public String toUpdateCardgroup(ModelMap map,HttpServletRequest request,@RequestParam(value = "feegroupid",required=false) int feegroupid){
		List<Cardgroup> cardgroups =  cardgroupService.findCardgroupByfeegroup(feegroupid);
		map.put("cardgroups", cardgroups);
		return "updateCardgroup";
	}	
	
	
	
	@RequestMapping(value="/listAllChannelAndCardgroup",method = RequestMethod.GET)
	public String listAllChannelAndCardgroup(ModelMap map,HttpServletRequest request,@RequestParam(value = "pageNum") int pageNum,@RequestParam(value = "opId",required=false) String opId){
		
	if(!StringUtils.isEmpty(opId)){
			
			Misoperator misoperator = 	misoperatorService.getMisoperatorByOpId(opId);
			
			if(misoperator != null) {
				request.getSession().setAttribute("opLevel",misoperator.getOpLevel());
			}
		}
		
		List<ChannelCardGroupData> 	cardgroupDatas =	cardgroupService.findAllChannelAndCardgroup((pageNum-1)*CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE);
		map.put("cardgroupDatas", cardgroupDatas);
		
		
		long cnt = cardgroupService.countAllChannelAndCardgroup();
		
		if(pageNum*CommonConstant.PAGE_SIZE>=cnt) {
			map.put("lastPage", 1);
		}else {
			map.put("lastPage", 0);
		}
		String opLevel = (String) request.getSession().getAttribute("opLevel");
		map.put("opLevel", opLevel);
		map.put("pageNum", pageNum);
		return "allChannelandCardGroupList";
	}	
	
	
	@RequestMapping(value="/toUpdateChannelcardgroup",method = RequestMethod.GET)
	public String toUpdateChannelcardgroup(ModelMap map,HttpServletRequest request,@ModelAttribute ChannelToCard channelToCard ,@RequestParam(value = "pageNum") int pageNum){
		ChannelCardGroupData channelCardGroupData=	cardgroupService.getChannelCardGroupDataByChannelIdAndFeegroupid(channelToCard);
		map.put("channelCardGroupData", channelCardGroupData);
		map.put("pageNum", pageNum);
		return "updatechannelCardgroup";
	}	
	
	
	
	@RequestMapping(value="/updateChannelCardgroup",method = RequestMethod.POST)
	public String updateChannelCardgroup(ModelMap map,HttpServletRequest request,@ModelAttribute ChannelCardGroupData channelCardGroupData,@RequestParam(value = "pageNum") int pageNum){
		cardgroupService.updateChannelCardGroup(channelCardGroupData);
		return "redirect:listAllChannelAndCardgroup?pageNum="+pageNum;
	}	
	
	
	@RequestMapping(value="/toChannelCardgroup",method = RequestMethod.GET)
	public String toChannelCardgroup(ModelMap map,HttpServletRequest request,@RequestParam(value = "feegroupid",required=false) int feegroupid,@RequestParam(value = "channelid",required=false) int channelid,@RequestParam(value = "pageNum") int pageNum,@RequestParam(value = "fromURL") String fromURL){
//		Cardgroup cardgroup = cardgroupService.getCardgrouprById(channelid);
		PaymentChannel paymentChannel = paymentchannelService.getPaymentchannelById(channelid);
		map.put("paymentChannel", paymentChannel);
		List<Cardgroup> cardgroups=  cardgroupService.findCardgroupByfeegroup(feegroupid);
		map.put("cardgroups", cardgroups);
		map.put("pageNum", pageNum);
		map.put("fromURL", fromURL);
		return "channelcardgroupdetail";
	}

}
