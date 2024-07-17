package com.naver.aak;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController{

	@Autowired
	WorkMatchDAO workMatchDAO;
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping( value="/login.do")
    public ModelAndView login(
			HttpSession session
	){
		session.removeAttribute("mid");
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName( "login.jsp" );
        return mav;
    }

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/loginProc.do")
    public int loginProc(
    		WorkMatchDTO workMatchDTO
			,HttpSession session
			,HttpServletResponse response
    		) {
    	//로그인 체크
    	int loginCnt = workMatchDAO.loginCheck(workMatchDTO);
    	if(loginCnt==0) { return 0; }
    	
    	String mid = workMatchDTO.getMid();

		Cookie cookie1 = new Cookie("mid",mid);
		cookie1.setMaxAge(60*60*24);

		response.addCookie(cookie1);
		session.setAttribute("mid", mid);
		
    	return loginCnt;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
}
