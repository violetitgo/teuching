package common.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.borajoin.teuching.member.model.vo.Member;
import com.borajoin.teuching.member.model.vo.Trainer;
import com.sun.mail.handlers.message_rfc822;

public class AuthInterceptor implements HandlerInterceptor {
	private Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("[interceptor] : preHandle");
		HttpSession session = request.getSession();

		if (session.getAttribute("loginInfo") == null) {
			if (!(request.getRequestURI().contains("index/") || request.getRequestURI().contains("matching/")
					|| request.getRequestURI().contains("member/") || request.getRequestURI().contains("post/detail.do")
					|| request.getRequestURI().contains("notice/"))) {
				request.setAttribute("msg", "로그인 이후 사용 가능한 기능입니다.");
				request.setAttribute("back", "back");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
				rd.forward(request, response);
			}
		} 
		
		// 회원용 매니저 페이지 접근 방지
		if (session.getAttribute("loginInfo")!= null && session.getAttribute("memberType").equals("member")) {
			Member m = (Member)session.getAttribute("loginInfo");
			if(m.getManager_yn().equals("N")) {
				if (request.getRequestURI().contains("/manager")) {
					request.setAttribute("msg", "관리자 페이지 입니다");
					request.setAttribute("back", "back");
					RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
					rd.forward(request, response);
				}
			}
		}
		
		// 트레이너 상담요청, 매니저 페이지 접근방지
		if(session.getAttribute("loginInfo")!= null && session.getAttribute("memberType").equals("trainer")) {
			if(request.getRequestURI().contains("/matchform")) {
				request.setAttribute("msg", "회원만 요청 가능한 페이지입니다");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/message/result.jsp");
				rd.forward(request, response);
			}
			if (request.getRequestURI().contains("/manager")) {
				request.setAttribute("msg", "관리자 페이지 입니다");
				request.setAttribute("back", "back");
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
				rd.forward(request, response);
			}
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("[interceptor] : postHandle");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.info("[interceptor] : afterCompletion");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
