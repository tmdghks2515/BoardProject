<%@page import="dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

	#container{
		width:1200px;
		margin:0 auto;
	}
	#board_list{
		margin:20px auto;
	}
	#board_list p{
		margin:0;
		height:41.2px;
		border-bottom:1px solid gray;
	}
	#board_list a:link,#board_list a:visited{
		display: block;
		color:gray;
		text-decoration: none;
	}
	#board_list p:hover{
		background-color: #f8f8f8;
	}
	#board_list span{
		display:block;
		width:14%;
		padding:10px 0;
		float:left;
		text-align: center;
	}
	/* .tit{
		width:35% !important;
	} */
</style>
<script>
	$(function(){
		$("#board_list a").click(function(){
			var bno = $(this).children().eq(0).text();
			location="board_view.jsp?bno="+bno;
		})
	})
	
</script>
</head>
<body>
<jsp:include page="/template/header.jsp"></jsp:include>
<div id="container">
	<div id="board_list">
		 <h2>게시판 목록</h2>
		 <button type="button" onclick="location='board_write_view.jsp'">글쓰기</button>
		<p style="background-color: #e8e8e8">
			<span>글번호</span>
			<span>작성자</span>
			<span class="tit">글제목</span>
			<span>조회수</span>
			<span>작성일</span>
			<span>좋아요</span>
			<span>싫어요</span>
		</p>
		<%
		ArrayList<BoardDTO> li = BoardService.getInstance().selectAll();
		for(int i=li.size()-1; i>=0; i--){
		%>
		<p><a href="#">
			<span><%=li.get(i).getBno() %></span>
			<span><%=li.get(i).getWriter() %></span>
			<span class="tit"><%=li.get(i).getTitle() %></span>
			<span><%=li.get(i).getbCount() %></span>
			<span><%=li.get(i).getbDate() %></span>
			<span><%=li.get(i).getbLike() %></span>
			<span><%=li.get(i).getbHate() %></span></a>
		<%} %>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>