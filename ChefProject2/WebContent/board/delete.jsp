<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>삭제하기</h3>
		<form action="delete_ok.do" method="post">
			<table>
				<tr>
					<td width="15%" align="right">비밀번호</td>
					<td width="85%" align="left">
						<input type="password" name="pwd" size="13">
						<input type="hidden" name="no" value="${no }">
						<input type="hidden" name="page" value="${page }">
					</td>					
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="삭제">
						<input type="button" value="취소" onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>