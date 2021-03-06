package com.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;
import com.dao.BoardDTO;

public class SearchModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
BoardDAO dao=new BoardDAO();
		
		String strPage=req.getParameter("page");
		if(strPage==null)
			strPage="1";
		
		int curPage=Integer.parseInt(strPage);
		String kind=req.getParameter("kind");
		List<BoardDTO> list=dao.boardSearch(curPage, kind);
		
		int totalPage=dao.boardSearchTotal(kind);
		int count=dao.boardSearchCount(kind);
		count=count-((curPage*5)-5);
		
		String msg="삭제된 게시물입니다";
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				
		//[1][2][3][4][5]
		//fp		   tp
		//블록나누기
		int block=5;		//......
		int fromPage=((curPage-1)/block*block)+1;
		int toPage=((curPage-1)/block*block)+block;
		if(toPage>totalPage)
			toPage=totalPage;
		//req.setAttribute("list", list);
		req.setAttribute("curPage", curPage);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("count", count);
		req.setAttribute("msg", msg);
		req.setAttribute("today", today);
		req.setAttribute("block", block);
		req.setAttribute("fromPage", fromPage);
		req.setAttribute("toPage", toPage);
		
		return "board/list.jsp";		
	}

}
