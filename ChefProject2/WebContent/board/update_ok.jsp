<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${bCheck==true}">
	<c:redirect url="list.do?page=${page }"></c:redirect>
</c:if>

<c:if test="${bCheck==false }">
	<script>
		alert('��й�ȣ�� Ȯ�����ּ���');
		history.back();
	</script>
</c:if>