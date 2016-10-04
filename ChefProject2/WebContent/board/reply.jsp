<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#sendBtn').click(function(){
			var name=$('#name').val();
			if(name.trim()==""){
				
			}
		$('#frm').submit();
		})
	});
</script>
</head>
<body>
	<center>
		<h3>답변하기</h3>
		<form action="reply_ok.do" method="post" id="frm">
		<table border="1" bordercolor="black" width="500" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<table>
						<tr>
							<th width="15%" align="left">이름</th>
							<td width="85%" align="left">
								<input type="text" name="name" size="12" id="name">
								<input type="hidden" name="no" value="${no }">
								<input type="hidden" name="page" value="${page }">
							</td>
						</tr>
						<tr>
							<th width="15%" align="left">제목</th>
							<td width="85%" align="left">
								<input type="text" name="subject" size="53" id="subject">
							</td>
						</tr>
						<tr>
							<th width="15%" align="left">내용</th>
							<td width="85%" align="left">
								<textarea rows="10" cols="40" name="content" id="content"></textarea>
							</td>
						</tr>
						<tr>
							<th width="15%" align="left">비밀번호</th>
							<td width="85%" align="left">
								<input type="password" name="pwd" size="10" id="pwd">
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" value="답변" id="sendBtn">
								<input type="button" value="취소" onclick="javascript:history.back()">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>		
		</form>
	</center>
</body>
</html>