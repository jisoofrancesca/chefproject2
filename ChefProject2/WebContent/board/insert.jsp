<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
</head>
<body>
	<center>
		<div id="div" align="center">
			<h1>�۾���</h1>
		</div>
		<table width="600" border="0">
		<br/>
			<tr>
				<th>ī�װ�</th>
				<td><select>
						<option>����</option>
						<option>�ѽ�</option>
						<option>���</option>
						<option>�߽�</option>
						<option>�Ͻ�</option>
						<option>��Ÿ</option>
				</select></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" size="20" /></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" size="70" /></td>
			</tr>
			<tr>
				<th>����</th>
				<td><textarea cols="71" rows="10"></textarea></td>
			</tr>
		</table>
		<table width="600">
			<tr>
				<td align="right">
					<input type="button" id="sendBt" value="�۾���"/> 
					<input type="button" value="�������" onclick="javascript:history.back()"/>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
	</center>
</body>
</html>