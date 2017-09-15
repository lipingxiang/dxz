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
import com.dxz.model.Misoperator;
import com.dxz.model.S2sconfig;
import com.dxz.service.MisoperatorService;
import com.dxz.service.S2sConfigService;

@Controller
public class S2SConfigController {
	
	
	@Autowired
	private MisoperatorService misoperatorService;
	

	@Autowired
	private S2sConfigService S2sConfigService;
	
	
	@RequestMapping(value="/gets2sconfigList",method = RequestMethod.GET)
	public String gets2sconfigList(ModelMap map,HttpServletRequest request,@RequestParam(value = "pageNum") int pageNum,@RequestParam(value = "opId",required=false) String opId){
		
		if(!StringUtils.isEmpty(opId)){
			
			Misoperator misoperator = 	misoperatorService.getMisoperatorByOpId(opId);
			if(misoperator != null) {
				request.getSession().setAttribute("opLevel",misoperator.getOpLevel());
			}
		}
		
		
		
		String opLevel = (String) request.getSession().getAttribute("opLevel");
		
		
		if("55".equals(opLevel) || "99".equals(opLevel)) {
			List<S2sconfig>  s2sconfigList = S2sConfigService.listS2sconfigPage((pageNum-1)*CommonConstant.PAGE_SIZE, CommonConstant.PAGE_SIZE);
			map.put("s2sconfigdataList", s2sconfigList);
		}
		
		long cnt = S2sConfigService.countS2sConfig();
		if(pageNum*CommonConstant.PAGE_SIZE>=cnt) {
			map.put("lastPage", 1);
		}else {
			map.put("lastPage", 0);
		}
		
		map.put("pageNum", pageNum);
		map.put("opLevel", opLevel);
		
		return "s2sconfigList";
	}
	
	
	@RequestMapping(value="/toUpdateS2sconfig",method = RequestMethod.GET)
	public String toVercontrol(ModelMap map,HttpServletRequest request,@RequestParam(value = "id") int id){	
		
		S2sconfig 	s2sconfig = null;
		s2sconfig = S2sConfigService.getS2sconfigById(id);
		map.put("s2sconfig", s2sconfig);
		return "updateS2sconfig";
	}
	
	
	
	
	@RequestMapping(value="/toAddS2sconfig",method = RequestMethod.GET)
	public String toAddVercontrol(ModelMap map,HttpServletRequest request){	
		
		
		
		return "addS2sconfig";
	}
	
	@RequestMapping(value="/updateS2sconfig",method = RequestMethod.POST)
	public String updateVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute  S2sconfig s2sConfig){	
//		verControlDao.updateVercontrol(vercontrol);
		S2sConfigService.updateS2sconfig(s2sConfig);
		return  "redirect:gets2sconfigList?pageNum=1"; 
	}
	
	@RequestMapping(value="/addS2sconfig",method = RequestMethod.POST)
	public String addVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute S2sconfig s2sConfig){	
		s2sConfig.setServerType(0);
		s2sConfig.setPassiveMode(0);
		s2sConfig.setGsid(0);
		s2sConfig.setRoomHeader(0);
		s2sConfig.setAcode(s2sConfig.getCode());
		S2sConfigService.addS2sconfig(s2sConfig);
		return  "redirect:gets2sconfigList?pageNum=1"; 
	}

}
