package com.yeonoo.sfow.basicinfo.LoginFilter;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener {

	 @Override
	    public void sessionCreated(HttpSessionEvent event) {
	        // 세션이 생성될 때 호출되는 메서드
	        HttpSession session = event.getSession();
	        session.setMaxInactiveInterval(600000); // 세션 만료 시간 설정 (초 단위)
	    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        // 세션이 종료될 때 호출되는 메서드입니다.
    }
}