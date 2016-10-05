package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.*;

public class InsertOkModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// insert.jsp 에서 온 데이터 받기
		req.setCharacterEncoding("EUC-KR");
		
		String name=req.getParameter("name");
		String subject=req.getParameter("subject");	//name속성값
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		String kind = req.getParameter("kind");
		
		BoardDTO d=new BoardDTO();
		d.setName(name);
		d.setSubject(subject);
		d.setContent(content);
		d.setPwd(pwd);
		d.setKind(kind);
		
		BoardDAO dao=new BoardDAO();
		dao.boardInsert(d);
		
		
		return "list.do";
	}

}
