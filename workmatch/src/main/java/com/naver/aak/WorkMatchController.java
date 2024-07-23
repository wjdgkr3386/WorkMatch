package com.naver.aak;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkMatchController {

	@Autowired
	WorkMatchService workMatchService;
	
	

	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping( value="/main.do")
    public ModelAndView main(
    		
    		HttpSession session
            ){
        ModelAndView mav = new ModelAndView();
        
    	String mid = (String) session.getAttribute("mid");
    	if(mid!=null) {
    		mav.addObject("mid", mid);
    	}
    	
        mav.setViewName( "main.jsp" );
        return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @RequestMapping( value="/posting.do")
    public ModelAndView posting(
    		HttpSession session
            ){         
        ModelAndView mav = new ModelAndView();

    	String mid = (String) session.getAttribute("mid");
    	if(mid!=null) {
    		mav.addObject("mid", mid);
    	}

        mav.setViewName( "posting.jsp" );
        return mav;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    @ResponseBody
    @RequestMapping( value="/postingProc.do")
    public Map<String,Object> postingProc(
    		HttpSession session,
    		WorkMatchDTO workMatchDTO
            ){         
    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	try {
	    	int postCnt = workMatchService.insertPost(workMatchDTO);
	    	map.put("postCnt", postCnt);
    	}catch(Exception e) {
	        System.out.println("Exception occurred at: " + e.getStackTrace()[0]);
	        e.printStackTrace();
    	}
        return map;
    }
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    
    
    
    

}
