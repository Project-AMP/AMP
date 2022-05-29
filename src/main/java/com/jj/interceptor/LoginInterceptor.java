package com.jj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	/*
	 * 사용설명 
	 * 인터셉터 적용법
	 * servlet-context.xml을 연다
	 * 
	 * 	<!-- 로그인 인터셉터 -->
		<beans:bean id="loginInterceptor" class="com.jj.interceptor.LoginInterceptor"></beans:bean>     -->LoginInterceptor를 빈으로 만든거다.
		
		<interceptors>
  		  	<interceptor>
      		  <mapping path="/message"/>         
      		  <mapping path="/joinClass.do"/>         		-->이 와같이 로그인 안하고는 못들어가는 페이지 주소를 등록해준다.
      		 	ex)    <mapping path="/  --설중해줄 주소--   "/> 를 추가 
      		  <beans:ref bean="loginInterceptor"/>			-->LoginInterceptor빈을 등록해준거다.
   			 </interceptor>
		</interceptors>
	 * 
	 */
	
	
	
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession();
	        // login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
	        Object obj = session.getAttribute("idx");
	        if ( obj == null ){
	            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
	            response.sendRedirect("/amp/notLogPage");//notLogPage.jsp를 호출한다.    	notLogPage.jsp에서는  alert("로그인 후 이용가능합니다") 를해주고 로그인 페이지로 이동시킨다. 결국 alert를 해주기 위해 notLogPage.jsp를 들려감
	            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
	        }
		return true;
	}

}
