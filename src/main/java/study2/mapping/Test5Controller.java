package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do5")
public class Test5Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test5Interface command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		if(com.equals("test5")) {
			viewPage += "test5.jsp";
		}
		else if(com.equals("HeowonList")) {
			command = new Test5HeowonListCommand();
			command.execute(request, response);
			viewPage += "HeowonList.jsp";
		}
		else if(com.equals("HeowonLogin")) {
			viewPage += "HeowonLogin.jsp";
		}
		else if(com.equals("HeowonLoginOk")) {
			command = new Test5HeowonLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("HeowonUpdate")) {
			command = new Test5UpdateCommand();
			command.execute(request, response);
			viewPage += "HeowonUpdate.jsp";
		}
		else if(com.equals("HeowonUpdateOk")) {
			command = new Test5HeowonOkUpdateCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("HeowonDelete")) {
			command = new Test5HeowonDeleteCommand();
			command.execute(request, response);
			viewPage += "HeowonDelete.jsp";
		}
		else if(com.equals("HeowonDeleteOk")) {
			command = new Test5HeowonDeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("HeowonSearch")) {
			command = new Test5HeowonSearchCommand();
			command.execute(request, response);
			viewPage += "HeowonSearch.jsp";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
