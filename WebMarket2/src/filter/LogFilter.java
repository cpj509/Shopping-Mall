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
		System.out.println("WebMarket �ʱ�ȭ");
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("������ Ŭ���̾�Ʈ IP : " + request.getRemoteAddr());
		System.out.println("������ URL ��� : " + getURLpath(request));
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
