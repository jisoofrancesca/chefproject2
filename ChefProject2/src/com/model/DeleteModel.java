package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		req.setAttribute("no", no);
		req.setAttribute("page", page);
		
		return "board/delete.jsp";
	}

}
