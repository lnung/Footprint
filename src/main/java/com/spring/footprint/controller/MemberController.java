package com.spring.footprint.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.footprint.domain.Member;
import com.spring.footprint.service.MemberService;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	@RequestMapping("register.do")
	public ModelAndView register(Member vo)throws Exception{
		memberService.registerMember(vo);
		return new ModelAndView("redirect:login_ani.jsp");
	}
	
	@RequestMapping("idcheck.do")
	public ModelAndView idcheck(String id)throws Exception{
		boolean flag = memberService.idcheck(id);
		System.out.println("flag:::"+flag);
		return new ModelAndView("JsonView", "flag", flag);
	}
	
	@RequestMapping("login.do")
	public ModelAndView login(HttpServletRequest request, Member pvo)throws Exception{
		String path = "loginError";
		
		System.out.println("pvo : "+pvo);
		Member rvo=memberService.login(pvo);
		System.out.println("rvo : "+rvo);
		
		if(rvo!=null) {
			request.getSession().setAttribute("vo", rvo);
			path = "loginSuccess";
		}
		return new ModelAndView(path);
	}
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session)throws Exception{
		if(session.getAttribute("vo")!=null) {
			session.invalidate();
		}
		return new ModelAndView("redirect:index.jsp");
	}
	
	@RequestMapping("update.do")
	public ModelAndView logout(HttpServletRequest request,Member pvo)throws Exception{
		memberService.updateMember(pvo);
		
		request.getSession().setAttribute("vo", pvo);
		return new ModelAndView("update_result");
	}
}
