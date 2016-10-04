<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Chef Project</title>
<link rel="stylesheet" type="text/css" href="board/list.css">
</head>
<body>
	<center>
		<div id="div" align="center">
			<h1><img alt="chef" src="board/image/chef.png" height="30px">&nbsp;The Recipe Board</h1>
		</div>
		<div>
			<ul>
				<li><a href="#">전체보기</a></li>
				<li class="dropdown">
					<a href="#" class="dtopbtn">카테고리</a>
					<div class="dropdown-content">
						<a href="#">한식</a>
						<a href="#">중식</a>
						<a href="#">일식</a>
						<a href="#">양식</a>
						<a href="#">기타</a>
					</div>
				</li>
			</ul>
		</div>
		<br/>
		<table border="0" width="1000">
			<tr>
				<td>
					<a href="insert.jsp"><img alt="write" src="board/image/write.png" width="40" height="auto"></a>
				</td>
			</tr>
		</table>
		<table border="0" width="1000" id="table_content">
			<tr>
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:forEach var="dto" items="${list }">
			<tr class="dataTr">
				<td width="10%" align="center">${dto.no }</td>
				<td width="50%" align="left">
					<c:if test="${dto.group_tab>0 }">
						<c:forEach var="i" begin="1" end="${dto.group_tab }">
							&nbsp;&nbsp;<img alt="comment" src="board/image/comment.png">						
						</c:forEach>
					</c:if>
					<c:if test="${msg == dto.subject }">
						<font color="red">${dto.subject }</font>
					</c:if>
					<c:if test="${msg != dto.subject }">${dto.kind}
						<a href="content.do?no=${dto.no }&page=${curPage}">&nbsp;${dto.subject }</a>
					
					</c:if>
					<c:if test="${today == dto.dbday }">
						<img alt="new" src="board/image/realnew.png" width="20" height="auto" style="vertical-align:top;"> 
					</c:if>
				</td>
				<td width="15%" align="center">${dto.name }</td>
				<td width="15%" align="center">${dto.regdate }</td>
				<td width="10%" align="center">${dto.hit }</td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" width="1000" id="icon">
			<tr>
				<td align="center">
					<a href="#" class="button">First</a>
					<a href="#" class="button">Prev</a>
					<c:forEach var="i" begin="${fromPage }" end="${toPage }">
						[
						<c:if test="${curPage==i }">
							<span style="color: red;">${i }</span>
						</c:if>
						<c:if test="${curPage!=i }">
							<a href="list.do?page=${i }">${i }</a>
						</c:if>
						]
					</c:forEach>
					<a href="#" class="button">Next</a>
					<a href="#" class="button">Last</a>
					
				</td>
			</tr>
		</table>
	</center>
</body>
</html>