package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;

public class ListModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		BoardDAO dao=new BoardDAO();
		req.setCharacterEncoding("EUC-KR");
		List<BoardDTO> list=new ArrayList<>();
		
		String kind=req.getParameter("kind");
		System.out.println(kind);
		String strPage=req.getParameter("page");
		
		if(strPage==null)
			strPage="1";
		
		int curPage=Integer.parseInt(strPage);		
		
		if(kind==null || kind.equals("")){
			list=dao.chefListData(curPage);
			int totalPage=dao.boardTotal();
			int count=dao.boardCount();
			count=count-((curPage*5)-5);
			String msg="삭제된 게시물입니다";
			String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			
			int block=5;		//......
			int fromPage=((curPage-1)/block*block)+1;
			int toPage=((curPage-1)/block*block)+block;
			if(toPage>totalPage)
				toPage=totalPage;
			req.setAttribute("list", list);
			req.setAttribute("curPage", curPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("count", count);
			req.setAttribute("msg", msg);
			req.setAttribute("today", today);
			req.setAttribute("block", block);
			req.setAttribute("fromPage", fromPage);
			req.setAttribute("toPage", toPage);
		}else{			
			list=dao.boardSearch(curPage, kind);
			int totalPage=dao.boardSearchTotal(kind);
			int count=dao.boardSearchCount(kind);
			count=count-((curPage*5)-5);
			
			String msg="삭제된 게시물입니다";
			String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			
			int block=5;		//......
			int fromPage=((curPage-1)/block*block)+1;
			int toPage=((curPage-1)/block*block)+block;
			if(toPage>totalPage)
				toPage=totalPage;
			req.setAttribute("list", list);
			req.setAttribute("curPage", curPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("count", count);
			req.setAttribute("msg", msg);
			req.setAttribute("today", today);
			req.setAttribute("block", block);
			req.setAttribute("fromPage", fromPage);
			req.setAttribute("toPage", toPage);
			req.setAttribute("kind", kind);
		}
		

		
		return "board/list.jsp";
	}

}
