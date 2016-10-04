package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.*;

public class ReplyOkModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("EUC-KR");
		
		String no=request.getParameter("no");
		String strPage=request.getParameter("page");
		
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardDTO dto=new BoardDTO();
		dto.setName(name);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPwd(pwd);
		
		BoardDAO dao=new BoardDAO();
		dao.boardReply(Integer.parseInt(no), dto);
		
		return "list.do";
	}

}
