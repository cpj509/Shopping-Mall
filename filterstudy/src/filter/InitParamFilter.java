package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {
	private FilterConfig filterConfig = null;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.filterConfig  = filterConfig;
		System.out.println("Filter01 초기화");
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		String message = "";
		
		if(id.equals(param1) && pwd.equals(param2)) {
			message = "로그인 성공";
		}else {
			message = "로그인 실패";
			writer.println(message);
			return;
		}
		
		writer.println(message);
		chain.doFilter(request, response);	//필터 실행
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Filter02 해제");
	}

}
