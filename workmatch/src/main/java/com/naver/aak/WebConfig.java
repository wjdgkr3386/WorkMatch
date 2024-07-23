package com.naver.aak;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SessionInterceptor())
                .order(1)
                .addPathPatterns("/**") // 적용할 경로
                .excludePathPatterns( "/main.do", "/login.do", "/loginProc.do", "/signUp.do",  "/signUpProc.do", "/css/**", "/js/**"); // 제외할 경로
    }
}