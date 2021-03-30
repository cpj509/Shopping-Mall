package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("WebMarket 초기화");
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("접속한 클라이언트 IP : " + request.getRemoteAddr());
		System.out.println("접근한 URL 경로 : " + getURLpath(request));
		chain.doFilter(request, response);
	}
	private String getURLpath(ServletRequest request) {
		// TODO Auto-generated method stub
		HttpServletRequest req;
		String currentPath = "";
		String queryString = "";
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest)request;
			currentPath = req.getRequestURI();
			queryString = req.getQueryString();
			queryString = (queryString == null) ? "" : "?" + queryString; 
		}
		return currentPath + queryString;
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("WebMarket");
	}
}
