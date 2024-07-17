package com.naver.aak;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;


public class SessionInterceptor   implements HandlerInterceptor  {

	@Override
	public boolean preHandle(
			HttpServletRequest    request 
			, HttpServletResponse response 
			, Object handler
	) throws Exception {

        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            String className = handlerMethod.getBeanType().getName();
            String methodName = handlerMethod.getMethod().getName();
        }
        
		HttpSession session = request.getSession();   
		String mid = (String)session.getAttribute("mid");	

		if(mid==null) {	
			response.sendRedirect( "/login.do" );
			return false;
		}
		else{ 
			return true;
		}
	}
	
}













