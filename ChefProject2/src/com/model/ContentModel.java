package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.*;

public class ContentModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String strNo=req.getParameter("no");
		String strPage=req.getParameter("page");
		
		BoardDAO dao=new BoardDAO();
		BoardDTO d=dao.chefContentData(Integer.parseInt(strNo));
		
		req.setAttribute("dto", d);
		req.setAttribute("page", strPage);
				
		return "board/content.jsp";
	}

}
