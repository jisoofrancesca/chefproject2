package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;
import com.dao.BoardDTO;

public class UpdateModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		String strNo = req.getParameter("no");
		String strPage = req.getParameter("page");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.chefUpdateData(Integer.parseInt(strNo));
		
		req.setAttribute("dto", dto);
		req.setAttribute("no", strNo);
		req.setAttribute("page", strPage);
		
		return "board/update.jsp";
	}

}
