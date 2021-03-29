package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class LogFileFilter implements Filter {

	PrintWriter writer = null;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		String filename = filterConfig.getInitParameter("filename");
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new ServletException("고르 파일을 열 수 없습니다.");
		}
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String clientAddr = request.getRemoteAddr();
		writer.printf("클라이언트 IP 주소 : %s \n", clientAddr);
		chain.doFilter(request, response);
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		writer.close();
	}
}
