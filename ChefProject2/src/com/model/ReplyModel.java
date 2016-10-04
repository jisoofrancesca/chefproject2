package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReplyModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String strNo=req.getParameter("no");
		String strPage=req.getParameter("page");
		req.setAttribute("no", strNo);
		req.setAttribute("page", strPage);
		
		return "board/reply.jsp";
	}

}
