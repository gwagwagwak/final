package frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import handle.HandleChangeInfoAction;
import handle.HandleImpl;
import handle.HandleJoinAction;
import handle.HandleLoginAction;
import handle.HandlePwChangAction;
import handle.HandleWriteAction;
import handle.HandlebbsAction;
import handle.HandledeleteAction;
import handle.HandlereviewAction;
import handle.HandlereviewListAction;
import handle.HandleupdateAction;
import handle.HandleviewAction;

/**
 * Servlet implementation class Boardfrontcontroller
 */
@WebServlet("*.do")
public class gevolutionfrontcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gevolutionfrontcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doHandle(request, response);
	}

	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//스크립트 사용
		PrintWriter out = response.getWriter();
	
		String ru1 = request.getRequestURI();
		String cp1 = request.getContextPath();
		String c1 = ru1.substring(cp1.length());	// /.do출력
		PrintWriter script = response.getWriter();
		String viewpage = null; //처리해서 보내는 페이지	
		HttpSession session=request.getSession(true);
		
		HandleImpl scmd1 = null;	//인터페이스 객체
		
		//인터페이스 객체  = null;
		/*
		if(c1.equals("/bbsAction.do")) {
			scmd1 = new HandlebbsAction();
		} else if(c1.equals("")) {
			
		}*/
		
		switch(c1) {
		case "/bbsAction.do":
			scmd1 = new HandlebbsAction();
			try {
				System.out.print("bbsAction 접근을 성공적으로 햇다.");
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "bbs.jsp";
			System.out.println("bbspage접근 성공");
			break;
			
		case "/viewAction.do":
			scmd1 = new HandleviewAction();
			try {
				scmd1.handle(request, response);
				System.out.print("viewAction 접근을 성공적으로 햇다.");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "view.jsp";
			System.out.println("viewpage접근 성공");
			break;
			
		case "/deleteAction.do":
			scmd1 = new HandledeleteAction();
			try {
				scmd1.handle(request, response);
				System.out.print("deleteAction 접근을 성공적으로 햇다.");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//viewpage = "bbs.jsp";
			viewpage = "bbsAction.do";
			
			System.out.println("delet 성공");
			/*script.println("location.href= 'bbsAction.do'");*/
			
			break;
			
		case "/updateAction.do":
			scmd1 = new HandleupdateAction();
			try {
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "bbsAction.do";
			System.out.print("update접근 성공");
			break;
		case "/writeAction.do":
			scmd1 = new HandleWriteAction();
			try {
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//db에러처리(알림창)
			if(Integer.parseInt(request.getAttribute("result").toString()) != 1) {
				response.setContentType("text/html; charset=UTF-8");
				out.println("<script language='javascript'>");
				out.println("alert('제목을 입력해주세요');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				System.out.println("db에러확인");
			}
			
			viewpage = "bbsAction.do";
			System.out.println("write접근 성공");
			break;
			
			//리뷰 글쓰기 처리
		case "/reviewAction.do":
			
			scmd1 = new HandlereviewAction();
			System.out.print("review Action 접근을 성공적으로 햇다.");
			try {
				scmd1.handle(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "reviewListAction.do";
			System.out.print("reviewwrite접근 성공");
			break;
		case "/reviewListAction.do":
			scmd1 = new HandlereviewListAction();
			try {
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "rank.jsp";
			System.out.print("reviewlist접근 성공");
			break;
			
		case "/loginAction.do":
			scmd1 = new HandleLoginAction();
			try {
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String link=(String)session.getAttribute("link");
			viewpage = link;
			System.out.print("로그인 성공");
			break;
		
		case "/logoutAction.do":
		    
			session.invalidate();	
			viewpage = "index.jsp";
			System.out.print("로그아웃 성공");
			break;
		
		case "/infoChange.do":
			try {
				scmd1 = new HandleChangeInfoAction();
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "changeInfo.jsp";
			System.out.print("정보변경성공");
			break;
		case "/pwChangeAction.do":
			try {
				scmd1 = new HandlePwChangAction();
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "pwChangeAction.do";
			System.out.print("정보변경성공");
			String link1=(String)session.getAttribute("link");
			viewpage = link1;
			break;
		case "/joinAction.do":
			try {
				scmd1 = new HandleJoinAction();
				scmd1.handle(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewpage = "login.jsp";
			System.out.print("정보변경성공");
			break;
		}
		
		
		
		System.out.println("뷰페이지 : " + viewpage);
		RequestDispatcher rd1 = request.getRequestDispatcher(viewpage);
		rd1.forward(request, response);
		
	}
	
	
	

}
