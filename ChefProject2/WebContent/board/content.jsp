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
		<h1>내용보기</h1>
		<hr width="610"/>
		<br/>
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
				<td colspan="4" align="left" valign="top" height="200" class="tdleft">${dto.content }</td>
			</tr>
		</table>
		<table width="600" border="0">
			<tr>
				<td align="right">
					<a href="reply.do?no=${dto.no }&page=${page}"><img alt="reply" src="board/image/reply.png" width="20" height="auto"></a>
					<a href="#"><img alt="modify" src="board/image/modify.png" width="20" height="auto"></a>
					<a href="#"><img alt="delete" src="board/image/delete.png" width="20" height="auto"></a>
					<a href="list.do?page=${page}"><img alt="list" src="board/image/list.png" width="20" height="auto"></a>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>