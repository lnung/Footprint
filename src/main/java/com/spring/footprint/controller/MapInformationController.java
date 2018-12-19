package com.spring.footprint.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.footprint.domain.MapInformation;
import com.spring.footprint.service.MapInformationService;
import com.spring.footprint.service.MemberBoardService;

@Controller
public class MapInformationController {
	@Resource
	private MapInformationService mapInformationService;
	@Resource
	private MemberBoardService memberBoardService;
	
	@RequestMapping("marker.do")
	public ModelAndView marker(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<MapInformation> worldList = mapInformationService.getWorldMapInformation();

		int check = 0;
		ModelAndView mv = new ModelAndView();
		mv.addObject("worldList", worldList);
		mv.addObject("check", check);
		mv.setViewName("myworld");
		return mv;
	}
	
	@RequestMapping("markerNation.do")
	public ModelAndView markerNation(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String worldName = request.getParameter("worldName");

		List<MapInformation> nationList = mapInformationService.getNationMapInformation(worldName);
		MapInformation nationCoordinate = mapInformationService.getNationCoordinate(worldName);
		
		int check = 1;
		ModelAndView mv = new ModelAndView();
		mv.addObject("worldName", worldName);
		mv.addObject("nationList", nationList);
		mv.addObject("nationCoordinate", nationCoordinate);
		mv.addObject("check", check);
		mv.setViewName("myworld");
		
		return mv;
	}
	
	
	@RequestMapping("markerCity.do")
	   public ModelAndView markerCity(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      String nationName = request.getParameter("nationName");
	      String worldName = request.getParameter("worldName");
	            
	      List<MapInformation> cityList = mapInformationService.getCityMapInformation(nationName);
	      MapInformation cityCoordinate = mapInformationService.getCityCoordinate(nationName);

	      String id = request.getParameter("id");
	      List<String> mcList = memberBoardService.selectMapList(id);
	                  
	      int check = 2;
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("mcList", mcList);
	      mv.addObject("worldName", worldName);
	      mv.addObject("nationName", nationName);
	      mv.addObject("cityList", cityList);
	      mv.addObject("cityCoordinate", cityCoordinate);
	      mv.addObject("check", check);
	      mv.setViewName("myworld");

	      return mv;
	   }

}
