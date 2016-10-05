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
			<h1>내용보기</h1>
		</div>
		<br />
		<table border="0" width="600" id="table_content">
			<tr>
				<th width="20%" class="thcenter">번호</th>
				<td width="30%" class="tdleft">&nbsp;${dto.no }</td>
				<th width="20%" class="thcenter">작성일</th>
				<td width="30%" class="tdleft">&nbsp;${dto.regdate }</td>
			</tr>
			<tr>
				<th width="20%" class="thcenter">작성자</th>
				<td width="30%" class="tdleft">&nbsp;${dto.name }</td>
				<th width="20%" class="thcenter">조회수</th>
				<td width="30%" class="tdleft">&nbsp;${dto.hit }</td>
			</tr>
			<tr>
				<th width="20%" class="thcenter" class="thcenter">제목</th>
				<td width="30%" colspan="3" class="tdleft">&nbsp;${dto.subject }</td>
			</tr>
			<tr>
				<td colspan="4" align="left" valign="top" height="200" class="tdcontent">${dto.content }</td>
			</tr>
			<tr>
				<td align="right" colspan="4">
					<a href="#"><input type="button" value="답글" class="button_content"/></a> 
					<a href="#"><input type="button" value="수정" class="button_content"/></a> 
					<a href="delete.do?no=${dto.no }&page=${page}"><input type="button" value="삭제" class="button_content"/></a>
					<a href="list.do?page=${page}"><input type="button" value="목록" class="button_content"/></a>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>