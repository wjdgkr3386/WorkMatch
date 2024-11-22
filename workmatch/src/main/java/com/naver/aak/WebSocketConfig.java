package com.naver.aak;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;



@Configuration
@EnableWebSocket
class WebSocketConfig implements WebSocketConfigurer {

    @Autowired
    private MyWebSocketHandler myWebSocketHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        // 웹소켓 핸들러를 특정 URL에 등록합니다.
        // "/ws" 엔드포인트로 접속하면 MyWebSocketHandler가 메시지를 처리합니다.
        // setAllowedOrigins("*")는 모든 도메인에서의 웹소켓 요청을 허용합니다.
        registry.addHandler(myWebSocketHandler, "/ws").setAllowedOrigins("http://main.do");
    }
}
