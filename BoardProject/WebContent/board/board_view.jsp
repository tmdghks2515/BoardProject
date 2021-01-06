<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<style>
	#container{
		width:1200px;
		height:600px;
		margin:0 auto;
	}
	#container table{
		width:100%;
		border-collapse: collapse;
		margin:30px auto;
	}
	#container tr{
		background-color: #e8e8e8;
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
	}
	#container th{
		padding: 10px 0;
	}
	#container th:nth-child(2){
		width:30%;
	}
	#content{
		width:1200px;
		margin:0 auto;
		padding:10px;
		box-sizing: border-box;
	}
	#btns{
		position: relative;
		text-align: center;
	}
	#btns img{
		width:30px;
		margin-bottom:-7px;
	}
	
	#btns button:nth-child(1),#btns button:nth-child(2){
		float:left;
	}
	#btns button:last-child{
		float:right;
	}
	#btns a:nth-child(3),#btns a:nth-child(6){
		margin: 0 60px;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		BoardDTO dto = BoardDAO.getInstance().selectBoardDTO(Integer.parseInt(request.getParameter("bno")));
	%>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div id="container">
		<table>
			<tr>
				<th>글 번호: <%=dto.getBno()%></th>
				<th>글 제목: <%=dto.getTitle()%></th>
				<th>작성자: <%=dto.getWriter() %>
				<th>조회수: <%=dto.getbCount() %></th>
				<th>작성일: <%=dto.getbDate() %></th>
				<th>좋아요: <%=dto.getbLike() %></th>
				<th>싫어요: <%=dto.getbHate()%></th>
			</tr>
		</table>
		<div id="content">
			<%=dto.getContent() %>
		</div>
		<br><hr>
		<div id="btns">
			<%
				if(session.getAttribute("id").equals(dto.getWriter())){
			%>
			<button type="button">수정</button>
			<button type="button">삭제</button>
			<%} %>
			<a href="#">이전글</a>
			좋아요 <a href="#"><img src="<%=request.getContextPath()%>/img/like.png"></a>
			싫어요 <a href="#"><img src="<%=request.getContextPath()%>/img/hate.png"></a>
			<a href="#">다음글</a>
			<button type="button" onclick="location='board_list_view.jsp'">목록보기</button>
		</div>
		
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>