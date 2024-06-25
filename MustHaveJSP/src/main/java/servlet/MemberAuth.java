package servlet;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet{
	private static final long serialVersionUID = 1L;
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException{
		//application 내장 객체 얻기
		ServletContext application = this.getServletContext();
		
		//web.xml에서 DB연결 정보 얻기
		String driver = application.getInitParameter("MySQLDriver");
		String connectUrl = application.getInitParameter("MySQLURL");
		String oId=  application.getInitParameter("MySQLID");
		String oPass=  application.getInitParameter("MySQLPwd");
		
		//Dao 생성
		dao = new MemberDAO(driver,connectUrl, oId,oPass);
	}
	@Override
	protected void service(HttpServletRequest req,HttpServletResponse resp)
		throws ServletException, IOException{
		//서블릿 초기화 매개변수에서 관리자아이디 받기
		String admin_id = this.getInitParameter("admin_id");
		
		//인증을 요청한 아이디/패스워드
		String id = req.getParameter("id");
		String pwd = req.getParameter("pass");
		
		//회원테이블에서 인증요청한 아이디/패스워드에 해당하는 회원찾기
		MemberDTO memberDTO = dao.getMemberDTO(id,pwd);
		
		//찾은 회원의 이름에 따른 처리
		String memberName = memberDTO.getName();
		if (memberName != null) { //일치하는 회원 찾음
			req.setAttribute("authMessage", memberName+" 회원님 안녕하세요 !");
		} else { //일치하는 회원 없음
			if (admin_id.equals(id)) //관리자
				req.setAttribute("authMessage", admin_id+"는 관리자입니다 !");
			else
				req.setAttribute("authMessage", "귀하는 회원이 아닙니다 !");
		}
		req.getRequestDispatcher("/12Servlet/MemberAuth.jsp").forward(req,resp);
	}
	@Override
	public void destroy() {
		dao.close();
	}
}