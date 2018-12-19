package com.spring.footprint.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.footprint.domain.ExchangeRate;
import com.spring.footprint.service.AdminBoardListVO;
import com.spring.footprint.service.AdminBoardService;
import com.spring.footprint.service.AdminTipBoardListVO;
import com.spring.footprint.service.AdminTipBoardService;
import com.spring.footprint.service.ExchangeRateService;
import com.spring.footprint.service.MemberTipBoardListVO;
import com.spring.footprint.service.MemberTipBoardService;

@Controller
public class ExchangeRateController {
   
   @Resource
   private ExchangeRateService exchangeRateService;
   @Resource
   private MemberTipBoardService memberTipBoardService;
   @Resource
   private AdminTipBoardService adminTipBoardService;   
   @Resource
   private AdminBoardService adminBoardService;   
   
   
	@RequestMapping("main.do")
	public ModelAndView main(String country, String MpageNo, String ApageNo, String pageNo) throws Exception{     
	   	List<ExchangeRate> getList = exchangeRateService.getExchangeRate(country);
	      
      	System.out.println("getList::"+getList);

      	int check = 1;
     	// 게시판(3개)
		MemberTipBoardListVO memberTipBoardListVO = memberTipBoardService.getMemberTipBoardList(MpageNo);
		AdminTipBoardListVO adminTipBoardListVO = adminTipBoardService.getAdminTipBoardList(ApageNo);
		AdminBoardListVO adminBoardListVO = adminBoardService.getAdminBoardList(pageNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberTipBoardListVO", memberTipBoardListVO);
		mv.addObject("adminTipBoardListVO", adminTipBoardListVO);
		mv.addObject("adminBoardListVO", adminBoardListVO);
		mv.addObject("check", check);
		mv.addObject("getList", getList);
		mv.setViewName("main");
		return mv;
		
	}
	
	@RequestMapping("selectchart.do")
	public ModelAndView selectChart(String country) throws Exception{      
		System.out.println(country);
	   	List<ExchangeRate> list = exchangeRateService.getExchangeRate(country);
      
      	System.out.println("list::"+list);
      	int check = 2;
      	ModelAndView mv = new ModelAndView();
		mv.addObject("check", check);
		mv.addObject("list", list);
		mv.setViewName("JsonView");
		return mv;
		
	}
	
	
   @RequestMapping("exchange.do")
   public ModelAndView exchangeSave(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  String countrys = request.getParameter("country");
	  String exchanges = request.getParameter("exchange");
	  ExchangeRate ex = new ExchangeRate();
      
      System.out.println(countrys);
      System.out.println(exchanges);
	  String[] cou = countrys.split(",");
	  String[] exc = exchanges.split(" ,");
	  
	  for(int i=0;i<exc.length;i++) {
		  exc[i] = exc[i].replaceAll(",", "");
	  }
	  

      for(int i=0; i<cou.length; i++) {
    	  if(cou[i].equals("위안화")) {
    		  ex.setCountry("중국");
    		  ex.setUnit(cou[i]);
    		  ex.setExchange(Double.parseDouble((exc[i])));
    		  exchangeRateService.insertExchangeRate(ex);
    	  }else if(cou[i].equals("유로")){
    		  ex.setCountry("유럽연합");
    		  ex.setUnit(cou[i]);
    		  ex.setExchange(Double.parseDouble(exc[i]));
    		  exchangeRateService.insertExchangeRate(ex);
    	  }else{
    		  String unit = cou[i].substring(cou[i].indexOf(" ")+1, cou[i].length());
    		  String country = cou[i].substring(0, cou[i].indexOf(" "));
    		  ex.setCountry(country);
    		  ex.setUnit(unit);
    		  ex.setExchange(Double.parseDouble(exc[i]));
    		  exchangeRateService.insertExchangeRate(ex);
    	  }
    	  System.out.println(ex);
      }

      return new ModelAndView("JsonView");
   }


}