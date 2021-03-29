package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter{
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Filter01 초기화");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");	//한글 인코딩
		response.setContentType("text/html; charset=utf-8");	//컨텐츠 유형
		PrintWriter writer = response.getWriter();	//출력
		
		//폼의 입력 자료 처리
		String name = request.getParameter("name");
		String message = "";
		if(name == null || name == "") {
			message = "입력 된 name의 값은 null 입니다.";
			writer.println(message);
			return;
		}
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Filter01 해제");
	}

}
