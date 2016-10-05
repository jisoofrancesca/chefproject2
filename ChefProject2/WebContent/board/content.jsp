<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css">
</head>
<body>
	<center>
		<div id="div" align="center">
			<h1>
				<img alt="chef" src="board/image/chef.png">요리하는 개발자의 요리 게시판
			</h1>
			<h2 align="center">내용보기</h2>
		</div>

		<br />
		<table border="0" width="600" id="table_content">
			<tr>
				<th width="20%">번호</th>
				<td width="30%">${dto.no }</td>
				<th width="20%">작성일</th>
				<td width="30%">${dto.regdate }</td>
			</tr>
			<tr>
				<th width="20%">작성자</th>
				<td width="30%">${dto.name }</td>
				<th width="20%">조회수</th>
				<td width="30%">${dto.hit }</td>
			</tr>
			<tr>
				<th width="20%">제목</th>
				<td width="30%" colspan="3">${dto.subject }</td>
			</tr>
			<tr>
				<td colspan="4" align="left" valign="top" height="200"
					class="tdleft">${dto.content }</td>
			</tr>
		</table>
		<table width="600" border="0">
			<tr>
				<td align="right"><a href="#"><img alt="reply" src="board/image/reply.png" width="20" height="auto"></a> 
					<a href="board/image/btn_modify.gif"><img alt="modify" src="board/image/modify.png"	width="20" height="auto"></a> 
					<a href="delete.do?no=${dto.no }&page=${page}"><img alt="delete" src="board/image/delete.png" width="20" height="auto"></a>
					<a href="list.do?page=${page}"><img alt="list" src="board/image/list.png" width="20" height="auto"></a>
				</td>
		</table>
	</center>
</body>
</html>