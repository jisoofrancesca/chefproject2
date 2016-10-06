package com.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;
import com.dao.BoardDTO;

public class UpdateOkModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String listHome = null;

		req.setCharacterEncoding("EUC-KR");

		String no = req.getParameter("no");
		String name = req.getParameter("name");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String pwd = req.getParameter("pwd");
		String kind = req.getParameter("kind");

		BoardDTO dto = new BoardDTO();
		dto.setNo(Integer.parseInt(no));
		dto.setName(name);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPwd(pwd);
		dto.setKind(kind);

		System.out.println(kind);

		BoardDAO dao = new BoardDAO();
		boolean bCheck = dao.chefUpdate(dto);

		if (bCheck == true) {
			listHome = "list.do";
		}

		return listHome;
	}

}
