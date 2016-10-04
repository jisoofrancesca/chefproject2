package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.*;

public class DeleteOkModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String pwd=req.getParameter("pwd");
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		
		BoardDAO dao=new BoardDAO();
		BoardDTO d=new BoardDTO();
		boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
		
		req.setAttribute("bCheck", bCheck);
		req.setAttribute("page", page);
		
		return "board/delete_ok.jsp";
	}

}
