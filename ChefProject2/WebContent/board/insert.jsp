<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
	
	function oneCheckbox(check){
		var obj = document.getElementsByName("kind");
		alert('하나의 카테고리만 선택해주세요');
		for(var i =0; i<obj.length;i++) {
			if(obj[i]!=check) {
				obj[i].checked = false;
			}
		}
	}
</script>
</head>
<body>
	<center>
		<div class="outer">
		<div class="inner">
		<div id="div" align="center" class="inner-title">
			<h1>글쓰기</h1>
		</div>
		<br />
		<form action="insert_ok.do" method="post" id="form">
			<table width="600" border="0">
				<tr>
					<th width="30%" class="thcenter">카테고리</th>
					<td width="70%" class="tdleft" id="kind">
					<input type="checkbox" value="한식" name="kind" onclick="oneCheckbox(this)"/>한식
					<input type="checkbox" value="양식" name="kind" onclick="oneCheckbox(this)"/>양식
					<input type="checkbox" value="중식" name="kind" onclick="oneCheckbox(this)"/>중식
					<input type="checkbox" value="일식" name="kind" onclick="oneCheckbox(this)"/>일식
					<input type="checkbox" value="기타" name="kind" onclick="oneCheckbox(this)"/>기타
					<!-- <select name="kind" id="kind">
							<option>선택</option>
							<option value="한식">한식</option>
							<option value="양식">양식</option>
							<option value="중식">중식</option>
							<option value="일식">일식</option>
							<option value="기타">기타</option>
					</select> -->
					</td>
				</tr>
				<tr>
					<th width="30%" class="thcenter">이름</th>
					<td width="70%" class="tdleft"><input type="text" size="20" name="name" id="name" /></td>
				</tr>
				<tr>
					<th width="30%" class="thcenter">제목</th>
					<td width="70%" class="tdleft"><input type="text" size="70" name="subject" id="subject" /></td>
				</tr>
				<tr>
					<th width="30%" class="thcenter">내용</th>
					<td width="70%" class="tdleft"><textarea cols="71" rows="10" name="content" id="content"></textarea></td>
				</tr>
				<tr>
					<th width="30%" class="thcenter">비밀번호</th>
					<td width="70%" class="tdleft"><input type="password" size="20" name="pwd" id="pwd"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" id="sendBt" value="글쓰기" />
						<input type="button" value="목록으로"	onclick="javascript:history.back()" />
					</td>
				</tr>


			</table>

		</form>
		</div>
		</div>
	</center>
</body>
</html>