package com.naver.aak;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController{

	@Autowired
	LoginDAO loginDAO;
	
	@Autowired
	LoginService loginService;
	
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
    		LoginDTO loginDTO
			,HttpSession session
			,HttpServletResponse response
    		) {
    	
    	String mid = loginDTO.getMid();
    	
    	//로그인 체크
    	int loginCnt = loginDAO.loginCheck(loginDTO);
    	if(loginCnt==0) { return 0; }
    	

		Cookie cookie1 = new Cookie("mid",mid);
		cookie1.setMaxAge(60*60*24);

		response.addCookie(cookie1);
		session.setAttribute("mid", mid);
		
    	return loginCnt;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping( value="/signUp.do")
    public ModelAndView signUp(
    		HttpSession session
            ){
        ModelAndView mav = new ModelAndView();
        
    	session.removeAttribute("mid");
    	
        mav.setViewName( "signUp.jsp" );
        return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/signUpProc.do")
    public Map<String,Integer> signUpProc(
    		LoginDTO loginDTO
    		) {
    	Map<String,Integer> map = new HashMap<String,Integer>();
    	try {
    		int signUpCnt = 0;
    		signUpCnt = loginService.insertUserInfo(loginDTO);
    		map.put("signUpCnt" , signUpCnt);
    		
    	} catch(Exception e){
	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
	        e.printStackTrace();
    		map.put("signUpCnt" , 0);
    	}
    	return map;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping( value="/infoUpdate.do")
    public ModelAndView infoUpdate(
    		HttpSession session
    		) {
        ModelAndView mav = new ModelAndView();
        String mid = (String) session.getAttribute("mid");
        
        Map<String,Object> infoMap = loginDAO.getInfo(mid); 
        
        mav.addObject("infoMap", infoMap);
        mav.addObject("mid", mid);
        mav.setViewName( "signUp.jsp" );
        
    	return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/infoUpdateProc.do")
    public Map<String,Integer> infoUpdateProc(
    		HttpSession session,
    		LoginDTO loginDTO
    		) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		
    	try {
    		int updateCnt = loginService.infoUpdate(loginDTO);
    		map.put("updateCnt", updateCnt);
    		return map;
    	}catch(Exception e) {
	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
	        e.printStackTrace();
    	}
    	return map;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/deleteAccountProc.do")
    public Map<String,Integer> deleteAccount(
    		HttpSession session,
    		LoginDTO loginDTO
    		) {
		Map<String, Integer> map = new HashMap<String,Integer>();
		
    	try {
    		int deleteCnt = loginService.deleteAccount(loginDTO);
    		map.put("deleteCnt", deleteCnt);
    		
    		if(deleteCnt==1) { session.removeAttribute("mid"); }
    		
    		return map;
    	}catch(Exception e) {
	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
	        e.printStackTrace();
    	}
    	return map;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    
    
    
}
