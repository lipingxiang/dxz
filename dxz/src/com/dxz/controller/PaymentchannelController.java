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
import com.dxz.vo.ChannelCardGroupData;

@Controller
public class PaymentchannelController {
	
	
	@Autowired
	private MisoperatorService misoperatorService;
	

	@Autowired
	private PaymentchannelService paymentchannelService;
	

	@Autowired
	private CardgroupService cardgroupService;
	
	
	@RequestMapping(value="/getPaymentchannelList",method = RequestMethod.GET)
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
			List<PaymentChannel> 	paymentChannelList =  paymentchannelService.listPaymentchannel((pageNum-1)*CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE);
			map.put("paymentChannelList", paymentChannelList);
		}
		
		long cnt = paymentchannelService.countPaymentchannelService();
		if(pageNum*CommonConstant.PAGE_SIZE>=cnt) {
			map.put("lastPage", 1);
		}else {
			map.put("lastPage", 0);
		}
		
		map.put("pageNum", pageNum);
		map.put("opLevel", opLevel);
		
		return "paymentChannelList";
	}
	
	
	

	@RequestMapping(value="/listCardGroupByChannelId",method = RequestMethod.GET)
	public String listCardGroupByChannelId(ModelMap map,HttpServletRequest request,@RequestParam(value = "channelId",required=false) int channelId){
		
		PaymentChannel 	paymentChannel  = paymentchannelService.getPaymentchannelById(channelId);
		
		String opLevel = (String) request.getSession().getAttribute("opLevel");
		
		if("55".equals(opLevel) || "99".equals(opLevel)) {
			List<ChannelCardGroupData>  cardgroupList =   cardgroupService.findCardgroupByChannelId(channelId);
			map.put("cardgroupList", cardgroupList);
		}
		
		
//		List<ChannelCardGroupData> 	cardgroupDatas =	cardgroupService.findAllChannelAndCardgroup((pageNum-1)*CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE);
//		map.put("cardgroupDatas", cardgroupDatas);
		map.put("pageNum", 0);
		map.put("opLevel", opLevel);
		map.put("paymentChannel", paymentChannel);
		return "channelcardgrouplist";
	}
	
	
	@RequestMapping(value="/toAddCardGrouptoChannel",method = RequestMethod.GET)
	public String toaddCardGrouptoChannel(ModelMap map,HttpServletRequest request,@RequestParam(value = "channelId",required=false) int channelId,@RequestParam(value = "pageNum") int pageNum){
		
		PaymentChannel 	paymentChannel  = paymentchannelService.getPaymentchannelById(channelId);
		
		String opLevel = (String) request.getSession().getAttribute("opLevel");
		
		if("55".equals(opLevel) || "99".equals(opLevel)) {
//			List<Cardgroup>  cardgroupList =   cardgroupService.findCardgroupByChannelId(channelId);
//			map.put("cardgroupList", cardgroupList);
		}
		List<Cardgroup> cardgroupList =   cardgroupService.findAllCardgroupByChannelId(channelId,(pageNum-1)*CommonConstant.PAGE_SIZE_CARDGROUP, CommonConstant.PAGE_SIZE_CARDGROUP);
		
		
		map.put("opLevel", opLevel);
		map.put("paymentChannel", paymentChannel);
		map.put("cardgroupList", cardgroupList);
		
		return "addCardGrouptoChannelList";
	}
	
	

	
	
	
	
	
	@RequestMapping(value="/toUpdatePaymentchannel",method = RequestMethod.GET)
	public String toUpdatePaymentchannel(ModelMap map,HttpServletRequest request,@RequestParam(value = "id") int id){	
		PaymentChannel 	pc = paymentchannelService.getPaymentchannelById(id);
		request.setAttribute("paymentchannel", pc);
		return "updatePaymentchannel";
	}
	
	@RequestMapping(value="/toAddPaymentchannel",method = RequestMethod.GET)
	public String toAddPaymentchannel(ModelMap map,HttpServletRequest request){	
		
		return "addPaymentchannel";
	}
//	
	@RequestMapping(value="/updatePaymentchannel",method = RequestMethod.POST)
	public String updateVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute PaymentChannel paymentChannel,@RequestParam(value = "supportOs",required=false) int[] supportOs){	
		int os = 0;
		if(supportOs != null) {
			for(int sos :supportOs) {
				os +=sos;
			}
		}
		paymentChannel.setOs(os);
		paymentchannelService.updatePaymentchannelService(paymentChannel);
		return  "redirect:getPaymentchannelList?pageNum=1"; 
	}
//	
	
	
	@RequestMapping(value="/addPaymentchannel",method = RequestMethod.POST)
	public String addVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute PaymentChannel paymentChannel,@RequestParam(value = "supportOs",required=false) int[] supportOs){
		
		int os = 0;
		if(supportOs != null) {
			for(int sos :supportOs) {
				os +=sos;
			}
		}
		paymentChannel.setOs(os);
		paymentchannelService.addPaymentchannel(paymentChannel);
		return  "redirect:getPaymentchannelList?pageNum=1"; 
	}
	
	@RequestMapping(value="/toAddCardgroupdetail",method = RequestMethod.GET)
	public String toAddCardgroupdetail(ModelMap map,HttpServletRequest request,@RequestParam(value = "feegroupid",required=false) int feegroupid,@RequestParam(value = "channelid",required=false) int channelid,@RequestParam(value = "msg",required=false) String msg){
		List<Cardgroup> cardgroups =  cardgroupService.findCardgroupByfeegroup(feegroupid);
		PaymentChannel paymentChannel  = paymentchannelService.getPaymentchannelById(channelid);
		map.put("cardgroups", cardgroups);
		map.put("channelid", channelid);
		map.put("paymentChannel", paymentChannel);
		if("existRecord".equals(msg)) {
			map.put("msg", "该记录已经存在！");
		}
		
		return "addCardgrouptoChannelDetail";
	}	
	
	@RequestMapping(value="/addCardGrouptoChannel",method = RequestMethod.POST)
	public String addCardGrouptoChannel(ModelMap map,HttpServletRequest request,@ModelAttribute ChannelToCard channelToCard){
		
		if(paymentchannelService.checkGrouptoChannelDataExists(channelToCard)>=1) {
			map.put("channelToCard", channelToCard);
			return "redirect:toAddCardgroupdetail?feegroupid="+channelToCard.getFeegroupid()+"&channelid="+channelToCard.getChannelid()+"&msg=existRecord";
		}else {
			paymentchannelService.addCardGrouptoChannel(channelToCard);
			return "redirect:listCardGroupByChannelId?channelId="+channelToCard.getChannelid();
		}
		
		
		
		
	}

}
