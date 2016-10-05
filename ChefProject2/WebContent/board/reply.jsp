<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#sendBt').click(function() {
			var name = $('#name').val();
			if (name.trim() == "") {
				$('#name').focus();
				$('#name').val("");
				alert('이름을 입력해주세요.');
				return;
			}
			var subject = $('#subject').val();
			if (subject.trim() == "") {
				$('#subject').focus();
				$('#subject').val("");
				alert('제목을 입력해주세요.');
				return;
			}

			var content = $('#content').val();
			if (content.trim() == "") {
				$('#content').focus();
				$('#content').val("");
				alert('내용을 입력해주세요.');
				return;
			}

			var pwd = $('#pwd').val();
			if (pwd.trim() == "") {
				$('#pwd').focus();
				$('#pwd').val("");
				alert('비밀번호를 입력해주세요.');
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
					<h1>답글달기</h1>
				</div>
				<br />
				<form action="reply_ok.do" method="post" id="form">
					<table class="table_content" width="600">
						<tr>
							<th class="thcenter" width="30%">이름</th>
							<td class="tdleft" width="70%">
								<input type="text" size="20" name="name" id="name"/>
								<input type="hidden" name="no" value="${no }"/>
								<input type="hidden" name="page" value="${page }"/>
							</td>

						</tr>
						<tr>
							<th class="thcenter" width="30%">제목</th>
							<td class="tdleft" width="70%"><input type="text" size="70" name="subject" id="subject"/></td>
						</tr>
						<tr>
							<th class="thcenter" width="30%">내용</th>
							<td class="tdleft" width="70%">
								<textarea cols="71" rows="10" name="content" id="content" name="content" id="content"></textarea>
							</td>
						</tr>
						<tr>
							<th class="thcenter" width="30%">비밀번호</th>
							<td class="tdleft" width="70%"><input type="password" size="20" name="pwd" id="pwd" /></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" id="sendBt" value="답글달기"/>
								<input type="button" value="목록으로" onclick="javascript:history.back()"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</center>
</body>
</html>