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
import com.dxz.model.Vercontrol;
import com.dxz.service.MisoperatorService;

@Controller
public class VerControlController {
	
	@Autowired
	private VerControlDao verControlDao;
	
	@Autowired
	private MisoperatorService misoperatorService;
	
	
	@RequestMapping(value="/getvercontrolList",method = RequestMethod.GET)
	public String getvercontrolList(ModelMap map,HttpServletRequest request,@RequestParam(value = "pageNum") int pageNum,@RequestParam(value = "opId",required=false) String opId){
		
		if(!StringUtils.isEmpty(opId)){
			Misoperator misoperator = 	misoperatorService.getMisoperatorByOpId(opId);
			if(misoperator != null) {
				request.getSession().setAttribute("opLevel",misoperator.getOpLevel());
			}
		}
		
		String opLevel = (String) request.getSession().getAttribute("opLevel");
		
		if("55".equals(opLevel) || "99".equals(opLevel)) {
			List<Vercontrol> vercontrolList = verControlDao.listVerConWithPage((pageNum-1)*CommonConstant.PAGE_SIZE,CommonConstant.PAGE_SIZE);
			map.put("vercontrollist", vercontrolList);
		}
		
		long cnt = verControlDao.countVerCon();
		if(pageNum*CommonConstant.PAGE_SIZE>=cnt) {
			map.put("lastPage", 1);
		}else {
			map.put("lastPage", 0);
		}
		
		map.put("pageNum", pageNum);
		map.put("opLevel", opLevel);
		
		return "vercontrolList";
	}
	
	
	@RequestMapping(value="/toUpdateVercontrol",method = RequestMethod.GET)
	public String toVercontrol(ModelMap map,HttpServletRequest request,@RequestParam(value = "id") int id){	
		
		Vercontrol 	vercontrol = null;
		if(id != 0) {
			vercontrol = verControlDao.getVercontrolById(id);
		}else {
			vercontrol = new Vercontrol();
		}
		map.put("vercontrol", vercontrol);
		return "updateVercontrol";
	}
	
	@RequestMapping(value="/toAddVercontrol",method = RequestMethod.GET)
	public String toAddVercontrol(ModelMap map,HttpServletRequest request){	
		return "addVercontrol";
	}
	
	@RequestMapping(value="/updateVercontrol",method = RequestMethod.POST)
	public String updateVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute Vercontrol vercontrol){	
		verControlDao.updateVercontrol(vercontrol);
		return  "redirect:getvercontrolList?pageNum=1"; 
	}
	
	@RequestMapping(value="/addVercontrol",method = RequestMethod.POST)
	public String addVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute Vercontrol vercontrol){	
		verControlDao.addVercontrol(vercontrol);
		return  "redirect:getvercontrolList?pageNum=1"; 
	}

}
