package com.dxz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dxz.constant.CommonConstant;
import com.dxz.dao.UserDao;
import com.dxz.dao.VerControlDao;
import com.dxz.model.Misoperator;
import com.dxz.model.Vercontrol;

@Controller
public class LoginController {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private VerControlDao verControlDao;
	
	
	@RequestMapping(value="/",method = RequestMethod.GET)
	public String getIndex(){	
		return "index";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(ModelMap map,HttpServletRequest request,@RequestParam(value = "userName") String userName){	
		
		int pageNum = 1;
		
		Misoperator misoperator = userDao.getMisoperatorByName(userName);
		if("55".equals(misoperator.getOpLevel()) || "99".equals(misoperator.getOpLevel())) {
			List<Vercontrol> vercontrolList = verControlDao.listVerConWithPage(pageNum,CommonConstant.PAGE_SIZE);
			map.put("vercontrollist", vercontrolList);
		}
		
		long cnt = verControlDao.countVerCon();
		if(pageNum*CommonConstant.PAGE_SIZE>=cnt) {
			map.put("lastPage", 1);
		}else {
			map.put("lastPage", 0);
		}
		
		map.put("pageNum", pageNum);
		map.put("opLevel", misoperator.getOpLevel());
		
		request.getSession().setAttribute("opLevel", misoperator.getOpLevel());
		
//		long misopCnt = misoperatorService.countMisoperator();
		return "vercontrolList";
	}
	
	
	

}
