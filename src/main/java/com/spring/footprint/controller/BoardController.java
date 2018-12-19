package com.spring.footprint.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.footprint.domain.MapInformation;
import com.spring.footprint.domain.Member;
import com.spring.footprint.domain.MemberBoard;
import com.spring.footprint.service.AdminBoardListVO;
import com.spring.footprint.service.AdminBoardService;
import com.spring.footprint.service.AdminTipBoardListVO;
import com.spring.footprint.service.AdminTipBoardService;
import com.spring.footprint.service.MapInformationService;
import com.spring.footprint.service.MemberBoardService;
import com.spring.footprint.service.MemberService;
import com.spring.footprint.service.MemberTipBoardListVO;
import com.spring.footprint.service.MemberTipBoardService;

@Controller
public class BoardController {
	@Resource
	private MemberTipBoardService memberTipBoardService;
	@Resource
	private AdminTipBoardService adminTipBoardService;
	@Resource
	private AdminBoardService adminBoardService;
	@Resource
	private MemberBoardService memberBoardService;
	@Resource
	private MapInformationService mapInformationService;
	@Resource
	private MemberService memberService;
	

	@RequestMapping("TipBoard.do")
	public ModelAndView TipBoard(String ApageNo, String MpageNo) throws Exception {
		MemberTipBoardListVO memberTipBoardListVO = memberTipBoardService.getMemberTipBoardList(MpageNo);

		AdminTipBoardListVO adminTipBoardListVO = adminTipBoardService.getAdminTipBoardList(ApageNo);
		System.out.println("adminTipBoardListVO::" + adminTipBoardListVO);
		System.out.println("memberTipBoardListVO::" + memberTipBoardListVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberTipBoardListVO", memberTipBoardListVO);
		mv.addObject("adminTipBoardListVO", adminTipBoardListVO);
		mv.setViewName("show_tip_list");
		return mv;
	}

	@RequestMapping("NoticeBoard.do")
	public ModelAndView NoticeBoard(String pageNo) throws Exception {
		AdminBoardListVO adminBoardListVO = adminBoardService.getAdminBoardList(pageNo);
		System.out.println("adminBoardListVO::" + adminBoardListVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("adminBoardListVO", adminBoardListVO);
		mv.setViewName("show_notice_list");
		return mv;
		/*
		 * new ModelAndView("show_notice_list", "adminBoardListVO", adminBoardListVO);
		 */
	}

	@RequestMapping("writeMemberTipBoard.do")
	public ModelAndView writeMemberTipBoard(HttpServletRequest request) throws Exception {
		return new ModelAndView("writeMemberTipBoard");
	}

	@RequestMapping("writeAdminBoard.do")
	public ModelAndView writeAdminBoard(HttpServletRequest request) throws Exception {
		return new ModelAndView("writeAdminBoard");
	}

	@RequestMapping("writeAdminTipBoard.do")
	public ModelAndView writeAdminTipBoard(HttpServletRequest request) throws Exception {
		return new ModelAndView("writeAdminTipBoard");
	}

	@RequestMapping("writeReviewBoard.do")
	public ModelAndView writeReviewBoard(HttpServletRequest request) throws Exception {
		return new ModelAndView("writeReviewBoard");
	}
	
	@RequestMapping("write.do")
	public ModelAndView submit(HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
	    String cityName = request.getParameter("cityName");
		String location = request.getParameter("location");
		String tripDate = request.getParameter("travelPeriod");
	    String content = request.getParameter("smarteditor");

	    Member mvo = memberService.selectByid(id);
	    
	    MapInformation mapvo = mapInformationService.getMapInformation(cityName);
	    MemberBoard mbvo = new MemberBoard(location, content, tripDate, mvo, mapvo);
	    
	    memberBoardService.writeMemberBoard(mbvo);
	    System.out.println("mapvo::"+mapvo);
	    System.out.println("mbvo::"+mbvo);
	    System.out.println("mbvo.getMapInformation().getCity()::"+mbvo.getMapInformation().getCity());

	    ModelAndView mv = new ModelAndView();
	    mv.addObject("id", mvo.getId());
	    mv.addObject("cityName", mbvo.getMapInformation().getCity());
	    mv.setViewName("redirect:memberBoardList.do");
	   return mv;

	}
	
	@RequestMapping("memberBoardList.do")
	public ModelAndView memberBoardList(HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		String cityName = request.getParameter("cityName");
		
		System.out.println("id:::"+id+",,,,,,,cityName::"+cityName);
		Member mvo = new Member(id);
		MapInformation mivo = new MapInformation(cityName);
		MemberBoard mbvo = new MemberBoard(mvo, mivo);
	    List<MemberBoard> mbList = memberBoardService.showMemberBoard(mbvo);
	    
	    System.out.println("mbList::"+mbList);
	    
	    return new ModelAndView("JsonView","mbList",mbList);
	}
}
