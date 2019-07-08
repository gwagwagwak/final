package handle;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;


public class HandlebbsAction implements HandleImpl {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		BoardDAO bdao = null;
		//BoardVO b1 = null;
		ArrayList<BoardVO> blist = null;
		
		int pageNumber = 1;	//기본 페이지 번호
		int begin = 0;
		int end = 0;
		int rowSize = 10;   //한행에서 출력할 수 
		
	
		/*	int id = Integer.parseInt(request.getParameter("id"));*/
		
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			System.out.println("파라미터 페이지 : " +pageNumber);
		}
		
		try {
			begin = (pageNumber * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
			end =(pageNumber * rowSize); //(1*10) = 10 //to
			
			System.out.println(begin);
			System.out.println(end);
			
		 	bdao = new BoardDAO();
			blist = bdao.getList(begin, end);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("페이지 : " +pageNumber);
		request.setAttribute("blist", blist);
		/*request.setAttribute("id", id);*/
		request.setAttribute("pageNumber", pageNumber);
		
	}
	
}
		/*
		 * TelInfoDAO tidao1 = null; TelInfoVO tv = null;
		 */
		// String id = request.getParameter("id");
	/*	int pageSize = 0;		// 한 페이지 당 보여줄 글 갯수
		int pageGroupSize = 0;	// 페이지그룹안의 페이지 갯수 ex) [이전] 1 2 3 4 5 [다음] 일 경우 페이지 갯수는 5
		int pageCount = 0;		// 총 페이지 수 
		
		String pageNumber = null;
		
		int currentPage = 0;	// 현재 페이지 번호(pageNumber)
		int startRow = 0;     	// 한 페이지의 시작글 번호
		int endRow = 0;			// 한 페이지의 마지막 글번호
		int count = 0;			// 게시물 총 갯수
		int number = 0;
		int pageGroupCount = 0;	// 페이지그룹의 갯수
								// ex) pageGroupSize가 3일 경우 '[1][2][3]'가 pageGroupCount 개 만큼 있다.
		int numPageGroup = 0;	// 페이지 그룹 번호
								// ex) pageGroupSize가 3일 경우 '[1][2][3]'의 페이지그룹번호는 1 이고 '[2][3][4]'의 페이지그룹번호는 2이다.
		*/
		
		
		
		/*try {
			
			pageSize = 10;
			pageGroupSize = 10;
			pageNumber = request.getParameter("pageNumber");// 페이지 번호
			
			if (pageNumber == null) {
				pageNumber = "1";}

			currentPage = Integer.parseInt(pageNumber);
			 startRow = (currentPage - 1) * pageSize + 1;
			 endRow = currentPage * pageSize;
			
			 count = 0;
			 number = 0;

			ArrayList articleList = new ArrayList();

			count = bdao.getTotal();// 전체 글의 수

			if (count > 0) {
				if (endRow > count)
					endRow = count;
				articleList = bdao.select(startRow, endRow);// 현재 페이지에 해당하는 글 목록
			} else {
				articleList = null;
			}

			number = count - (currentPage - 1) * pageSize;// 글목록에 표시할 글번호

			pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
			
			numPageGroup = (int) Math.ceil((double) currentPage / pageGroupSize);
			
			pageCount = count / pageSize;
			if(count % pageSize > 0) pageCount++;
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		
		
		
		// 해당 뷰에서 사용할 속성
		/*request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("pageCount", pageCount);
		
		
		request.setAttribute("number", new Integer(number));
		request.setAttribute("pageGroupSize", new Integer(pageGroupSize));
		request.setAttribute("numPageGroup", new Integer(numPageGroup));
		request.setAttribute("pageGroupCount", new Integer(pageGroupCount));
		request.setAttribute("articleList", articleList);*/
		
/*
		try {
			// tidao1 = new TelInfoDAO();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			// tv = tidao1.getInfo(name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/

		// request.setAttribute("sname", name);
		// request.setAttribute("stv", tv);
	/*}

}
*/