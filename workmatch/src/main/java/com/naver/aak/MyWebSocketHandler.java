package com.naver.aak;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class MyWebSocketHandler extends TextWebSocketHandler{

	@Autowired
	WorkMatchDAO workMatchDAO;


	// 웹소켓 연결이 연결 되었을 때 호출되는 메서드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("웹소켓 연결 : " + session.getId());
    }

	//클라이언트가 서버로 텍스트 보낼 시 호출되는 메서드
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
    	String mid;
        try {
        	int checkApplicationCnt = 0;
            mid = message.getPayload();

            while(true) {
		        checkApplicationCnt = workMatchDAO.checkApplicationCnt(mid);
	            // 응답 메시지 보내기
	            session.sendMessage(new TextMessage(checkApplicationCnt+""));
	            Thread.sleep(1000 * 10);
            }

        }catch(Exception e) {
        	System.out.println(e);
        }finally {
        	try {
        		session.close();
        	}catch(Exception ex) {
        		System.out.println(ex);
        	}
        }
    }

    // 연결이 종료될 때 호출되는 메서드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("연결 종료");
    }

}