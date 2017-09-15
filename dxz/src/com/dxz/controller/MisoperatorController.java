package com.dxz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dxz.constant.CommonConstant;
import com.dxz.model.Misoperator;
import com.dxz.service.MisoperatorService;

@Controller
public class MisoperatorController {
	
	@Autowired
	private MisoperatorService misoperatorService;
	
	
	@RequestMapping(value="/getMisoperatorList",method = RequestMethod.GET)
	public String getMisoperatorList(ModelMap map,HttpServletRequest request,@RequestParam(value = "pageNum") int pageNum){
		String opLevel = (String) request.getSession().getAttribute("opLevel");
		
		if("55".equals(opLevel) || "99".equals(opLevel)) {
			List<Misoperator> misoperatorList = misoperatorService.listMisoperatorPage((pageNum-1)*CommonConstant.PAGE_SIZE,CommonConstant.PAGE_SIZE);
			map.put("misoperatorList", misoperatorList);
		}
		
		long cnt = misoperatorService.countMisoperator();
		if(pageNum*CommonConstant.PAGE_SIZE>=cnt) {
			map.put("lastPage", 1);
		}else {
			map.put("lastPage", 0);
		}
		
		map.put("pageNum", pageNum);
		map.put("opLevel", opLevel);
		
		return "misoperatorList";
	}
	
	
	@RequestMapping(value="/toUpdateMisoperator",method = RequestMethod.GET)
	public String toVercontrol(ModelMap map,HttpServletRequest request,@RequestParam(value = "id") int id){	
		
//		Vercontrol 	vercontrol = null;
//		if(id != 0) {
//			vercontrol = verControlDao.getVercontrolById(id);
//		}else {
//			vercontrol = new Vercontrol();
//		}
//		map.put("vercontrol", vercontrol);
		Misoperator misoperator =	misoperatorService.getMisoperatorById(id);
		map.put("misoperator", misoperator);
		return "updateMisoperator";
	}
	
	@RequestMapping(value="/toAddMisoperator",method = RequestMethod.GET)
	public String toAddVercontrol(ModelMap map,HttpServletRequest request){	
		return "addMisoperator";
	}
	
	@RequestMapping(value="/updateMisoperator",method = RequestMethod.POST)
	public String updateVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute Misoperator misoperator){	
		misoperatorService.updateMisoperator(misoperator);
		return  "redirect:getMisoperatorList?pageNum=1"; 
	}
	
	@RequestMapping(value="/addMisoperator",method = RequestMethod.POST)
	public String addVercontrol(ModelMap map,HttpServletRequest request,@ModelAttribute Misoperator misoperator){	
		misoperatorService.addMisoperator(misoperator);
		return  "redirect:getMisoperatorList?pageNum=1"; 
	}

}
