package com.naver.aak;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkMatchController {

    @RequestMapping( value="/main.do")
    public ModelAndView main(
            ){
    	
        ModelAndView mav = new ModelAndView();
        mav.setViewName( "main.jsp" );
        return mav;
    }
    


    @RequestMapping( value="/signUp.do")
    public ModelAndView signUp(
            ){
        ModelAndView mav = new ModelAndView();
        mav.setViewName( "signUp.jsp" );
        return mav;
    }


}
