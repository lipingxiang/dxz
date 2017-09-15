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
import com.dxz.dao.VerControlDao;
import com.dxz.model.Misoperator;
import com.dxz.model.S2sconfig;
import com.dxz.model.Vercontrol;
import com.dxz.model.v2gameserverinfo;
import com.dxz.service.GameserverinfoService;
import com.dxz.service.MisoperatorService;
import com.dxz.service.S2sConfigService;

@Controller
public class GameServerInfoController {
	
	@Autowired
	private VerControlDao verControlDao;
	
	@Autowired
	private MisoperatorService misoperatorService;
	
	@Autowired
	private GameserverinfoService gameserverinfoService;

	@Autowired
	private S2sConfigService s2sConfigService;
	
	
	@RequestMapping(value="/getgameserverinfoList",method = RequestMethod.GET)
	public String getvercontrolList(ModelMap map,HttpServletRequest request,@RequestParam(value = "pageNum") int pageNum,@RequestParam(value = "opId",required=false) String opId){
		
		if(!StringUtils.isEmpty(opId)){
			Misoperator misoperator = 	misoperatorService.getMisoperatorByOpId(opId);
			if(misoperator != null) {
				request.getSession().setAttribute("opLevel",misoperator.getOpLevel());
			}
		}
		
		String opLevel = (String) request.getSession().getAttribute("opLevel");
		
		if("55".equals(opLevel) || "99".equals(opLevel)) {
//			List<v2gameserverinfo> gameserverinfList = verControlDao.listVerConWithPage((pageNum-1)*CommonConstant.PAGE_SIZE,CommonConstant.PAGE_SIZE);
			
			 List<v2gameserverinfo> v2gameserverinfoList =   gameserverinfoService.listGameserverinfoPage((pageNum-1)*CommonConstant.PAGE_SIZE,CommonConstant.PAGE_SIZE);
			
			map.put("gameserverinfList", v2gameserverinfoList);
		}
		
		long cnt = gameserverinfoService.countGameserverinfo();
		if(pageNum*CommonConstant.PAGE_SIZE>=cnt) {
			map.put("lastPage", 1);
		}else {
			map.put("lastPage", 0);
		}
		
		map.put("pageNum", pageNum);
		map.put("opLevel", opLevel);
		
		return "gameserverinfoList";
	}
	
	
	@RequestMapping(value="/toUpdateGameserverinfo",method = RequestMethod.GET)
	public String toUpdateGameserverinfo(ModelMap map,HttpServletRequest request,@RequestParam(value = "id") int id){	
		
//		Vercontrol 	vercontrol = null;
//		if(id != 0) {
//			vercontrol = verControlDao.getVercontrolById(id);
//		}else {
//			vercontrol = new Vercontrol();
//		}
		
//		map.put("vercontrol", vercontrol);
		List<S2sconfig> centerS2sconfigList = 	s2sConfigService.findCenterS2sconfig();
		map.put("centerS2sconfigList", centerS2sconfigList);
		v2gameserverinfo  v2gameserverinfo = gameserverinfoService.getGameserverinfoById(id);
		S2sconfig s2sconfig = s2sConfigService.getS2sconfigByGsidAndAcode(Long.valueOf(v2gameserverinfo.getId()).intValue(), v2gameserverinfo.getCscode());
		map.put("s2sconfig", s2sconfig);
		map.put("v2gameserverinfo", v2gameserverinfo);
		return "updateGameserverinfo";
	}
	
	@RequestMapping(value="/toAddGameserverinfo",method = RequestMethod.GET)
	public String toAddGameserverinfo(ModelMap map,HttpServletRequest request){	
		List<S2sconfig> centerS2sconfigList = 	s2sConfigService.findCenterS2sconfig();
		map.put("centerS2sconfigList", centerS2sconfigList);
		return "addGameserverinfo";
	}
	
	@RequestMapping(value="/updateGameserverinfo",method = RequestMethod.POST)
	public String updateVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute v2gameserverinfo v2gameserverinfo,@RequestParam(value = "s2sCid") int s2sCid,@RequestParam(value = "code") String code,@RequestParam(value = "sdesc") String sdesc){	
//		verControlDao.updateVercontrol(vercontrol);
		v2gameserverinfo.setWebsocketURL(v2gameserverinfo.getGameserviceip()+":"+v2gameserverinfo.getPort());
		gameserverinfoService.updateGameserverinfo(v2gameserverinfo);
		S2sconfig s2sconfig = new S2sconfig();
		s2sconfig.setId(s2sCid);
		s2sconfig.setEnable(v2gameserverinfo.getEnable());
		s2sconfig.setServerType(1);
		s2sconfig.setCode(code);
		s2sconfig.setAcode(v2gameserverinfo.getCscode());
		s2sconfig.setWebsocketURL(v2gameserverinfo.getWebsocketURL());
		s2sconfig.setGsid(Long.valueOf(v2gameserverinfo.getId()).intValue());
		s2sconfig.setRoomHeader(v2gameserverinfo.getIdHeader());
		s2sconfig.setPassiveMode(1);
		s2sconfig.setSdesc(sdesc);
		s2sconfig.setMatchhistoryid(0);
		s2sconfig.setHttpURL(" ");
		s2sConfigService.updateS2sconfig(s2sconfig);
		return  "redirect:getgameserverinfoList?pageNum=1"; 
	}
	
	@RequestMapping(value="/addGameserverinfo",method = RequestMethod.POST)
	public String addVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute v2gameserverinfo v2gameserverinfo,@RequestParam(value = "code") String code,@RequestParam(value = "sdesc") String sdesc){	
		
		v2gameserverinfo.setWebsocketURL(v2gameserverinfo.getGameserviceip()+":"+v2gameserverinfo.getPort());
		
		gameserverinfoService.addGameserverinfo(v2gameserverinfo);
		
		S2sconfig s2sconfig = new S2sconfig();
		
		s2sconfig.setEnable(v2gameserverinfo.getEnable());
		s2sconfig.setServerType(1);
		// code
		s2sconfig.setCode(code);
		s2sconfig.setAcode(v2gameserverinfo.getCscode());
		s2sconfig.setWebsocketURL(v2gameserverinfo.getWebsocketURL());
		s2sconfig.setGsid(Long.valueOf(v2gameserverinfo.getId()).intValue());
		s2sconfig.setRoomHeader(v2gameserverinfo.getIdHeader());
		s2sconfig.setPassiveMode(1);
		s2sconfig.setSdesc(sdesc);
		s2sconfig.setMatchhistoryid(0);
		s2sconfig.setHttpURL(" ");
		
		s2sConfigService.addS2sconfig(s2sconfig);
		
		return  "redirect:getgameserverinfoList?pageNum=1"; 
	}

}
