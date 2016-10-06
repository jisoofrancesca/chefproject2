<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css"/>
<script type="text/javascript">
	$(function(){
		$('#sendbtn').click(function(){
			var pwd = $('#pwd').varl();
			if(pwd.trim()==""){
				$('#pwd').focus();
				$('#pwd').val("");
				alert('비밀번호를 입력해주세요');
				return;
			}
			$('#form').submit();
		})
	});
</script>
</head>
<body>
	<center>
		<div class="outer">
		<div class="inner">
		<div id="div" align="center" class="inner-title">
			<h1>수정하기</h1>
		</div>
		<br/>
		<form action="update_ok.do" method="post" id="form">
		<table class="table_content" width="600">
			<tr>
				<th class="thcenter" width="30%">카테고리</th>
				<td class="tdleft" width="70%">
					${dto.kind }
					&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="kind" value="한식"/>한식
					<input type="checkbox" name="kind" value="양식"/>양식
					<input type="checkbox" name="kind" value="중식"/>중식
					<input type="checkbox" name="kind" value="일식"/>일식
					<input type="checkbox" name="kind" value="기타"/>기타
				</td>
			</tr>
			<tr>
				<th class="thcenter" width="30%">이름</th>
				<td class="tdleft" width="70%">
					<input type="text" size="20" value="${dto.name }" id="name" name="name"/>
				</td>
			</tr>
			<tr>
				<th class="thcenter" width="30%">제목</th>
				<td class="tdleft" width="70%"><input type="text" size="70" value="${dto.subject }" id="subject" name="subject"/></td>
			</tr>
			<tr>
				<th class="thcenter" width="30%">내용</th>
				<td class="tdleft" width="70%">
					<textarea cols="71" rows="10" id="content" name="content">${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<th class="thcenter" width="30%">비밀번호</th>
				<td class="tdleft" width="70%">
					<input type="password" size="20" id="pwd" name="pwd" value="${dto.pwd }"/>
					<input type="hidden" name="no" value="${no }"/>
					<input type="hidden" name="page" value="${page }"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="sendbtn" value="수정"/>
					<input type="button" value="취소" onclick="javascript:history.back()"/>
				</td>
			</tr>
		</table>
		</form>
		</div>
		</div>
	</center>
</body>
</html>