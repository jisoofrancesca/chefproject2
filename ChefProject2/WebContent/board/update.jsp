<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="board/table.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#sendbtn').click(function(){
			var pwd = $('#pwd').val();
			if(pwd.trim()==""){
				$('#pwd').focus();
				$('#pwd').val("");
				alert('��й�ȣ�� �Է����ּ���');
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
			<h1>�����ϱ�</h1>
		</div>
		<br/>
		<form action="update_ok.do" method="post" id="form">
		<table class="table_content" width="600">
			<tr>
				<th class="thcenter" width="30%">ī�װ�</th>
				<td class="tdleft" width="70%">
					${dto.kind }
					&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="kind" value="�ѽ�"/>�ѽ�
					<input type="checkbox" name="kind" value="���"/>���
					<input type="checkbox" name="kind" value="�߽�"/>�߽�
					<input type="checkbox" name="kind" value="�Ͻ�"/>�Ͻ�
					<input type="checkbox" name="kind" value="��Ÿ" checked="checked"/>��Ÿ
				</td>
			</tr>
			<tr>
				<th class="thcenter" width="30%">�̸�</th>
				<td class="tdleft" width="70%">
					<input type="text" size="20" value="${dto.name }" id="name" name="name"/>
				</td>
			</tr>
			<tr>
				<th class="thcenter" width="30%">����</th>
				<td class="tdleft" width="70%"><input type="text" size="70" value="${dto.subject }" id="subject" name="subject"/></td>
			</tr>
			<tr>
				<th class="thcenter" width="30%">����</th>
				<td class="tdleft" width="70%">
					<textarea cols="71" rows="10" id="content" name="content">${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<th class="thcenter" width="30%">��й�ȣ</th>
				<td class="tdleft" width="70%">
					<input type="password" size="20" id="pwd" name="pwd"/>
					<input type="hidden" name="no" value="${no }"/>
					<input type="hidden" name="page" value="${page }"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="sendbtn" value="����"/>
					<input type="button" value="���" onclick="javascript:history.back()"/>
				</td>
			</tr>
		</table>
		</form>
		</div>
		</div>
	</center>
</body>
</html>