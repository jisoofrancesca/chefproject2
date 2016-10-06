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
<script type="text/javascript">
	$(function(){
		$('#Btn').click(function(){
			$("#frm").submit();
		})
	});
</script>
</head>
<body>
   <center>
      <div class="outer">
      <div  class="inner">
      <div id="div" align="center" class="inner-title">
         <a href="list.do" id="home"><h1><img alt="chef" src="board/image/chef.png" height="40px" style="vertical-align: top;">The Recipe Board</h1></a>
      </div>
      <!-- <div>
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
      </div> -->
      <br/>
      <table border="0" width="900">
         <tr>
            <td width="5%">
               <a href="insert.do"><img alt="write" src="board/image/write.png" width="40" height="auto"></a>
            </td>
            <td width="95%" align="right"> 카테고리 : 
            <form id="frm" action="list.do" method="post">
               <select name="kind">
                  <option>선택</option>
					<option value="한식">한식</option>
					<option value="양식">양식</option>
					<option value="중식">중식</option>
					<option value="일식">일식</option>
					<option value="기타">기타</option>
               </select>
               	<button value="검색" id="Btn" style="width: 30px; height: 30px; background: url('board/image/search.png'); background-size: cover;"></button>
               	</form>
            </td>
         </tr>
      </table>
      <table border="0" width="900" id="table_content">
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
                     &nbsp;&nbsp;
                  </c:forEach>
                     <img alt="comment" src="board/image/comment.png" height="20">                  
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
      <table border="0" width="900" id="icon" class="table_content">
         <tr>
            <td align="center">
               <c:if test="${curPage <= block }">
                  <a href="list.do?page=1" class="button">First</a>
                  <a href="list.do?page=${curPage>1?curPage-1:curPage }" class="button">Prev</a>
               </c:if>
               <c:if test="${curPage>block }">
                  <a href="list.do?page=1" class="button">First</a>
                  <a href="list.do?page=${frompage-1 }">Prev</a>
               </c:if>
               <c:forEach var="i" begin="${fromPage }" end="${toPage }">
                  [
                  <c:if test="${curPage==i }">
                     <span style="color: red;">${i }</span>
                  </c:if>
                  <c:if test="${curPage!=i }">
                     <a href="list.do?page=${i }&kind=${kind }">${i }</a>
                  </c:if>
                  ]
               </c:forEach>
               <c:if test="${toPage<totalPage }">
                  <a href="list.do?page=${toPage+1 }"><img src="board/image/first.png" alt="first"></a>
                  <a href="list.do?page=${totalPage }" class="button">Last</a>
               </c:if>
               <c:if test="${toPage >= totalPage }">
                  <a href="list.do?page=${curPage<totalPage? curPage+1: curPage }" class="button">Next</a>
                  <a href="list.do?page=${totalPage }" class="button">Last</a>
               </c:if>
               
            </td>
         </tr>
      </table>
      </div>
      <div id="footer">
         <b>MADE-BY 이지수 최연욱 구경태 최태석</b>&nbsp;&nbsp;COPYRIGHT &copy; SIST. All Rights Reserved
         <address></address>
      </div>
      </div>
   </center>
</body>
</html>