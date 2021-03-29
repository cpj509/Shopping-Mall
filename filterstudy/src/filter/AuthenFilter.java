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
		System.out.println("Filter01 �ʱ�ȭ");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");	//�ѱ� ���ڵ�
		response.setContentType("text/html; charset=utf-8");	//������ ����
		PrintWriter writer = response.getWriter();	//���
		
		//���� �Է� �ڷ� ó��
		String name = request.getParameter("name");
		String message = "";
		if(name == null || name == "") {
			message = "�Է� �� name�� ���� null �Դϴ�.";
			writer.println(message);
			return;
		}
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("Filter01 ����");
	}

}
