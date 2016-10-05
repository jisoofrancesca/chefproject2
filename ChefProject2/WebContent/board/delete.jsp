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
			<h1>글쓰기</h1>
		</div>
		<br/>
		<form action="delete_ok.do" method="post">
			<table width="400">
				<tr>
					<th width="25%" align="right" class="thcenter">비밀번호</th>
					<td width="45%" align="left">
						<input type="password" name="pwd" size="20">
						<input type="hidden" name="no" value="${no }">
						<input type="hidden" name="page" value="${page }">
					</td>
					<td colspan="2" align="center" width="30%">
						<input type="submit" value="삭제">
						<input type="button" value="취소" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>