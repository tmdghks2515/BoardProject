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
		border-bottom:1px solid gray;
	}
	#board_list>p a:link,#board_list>p a:visited{
		display: inline-block;
		color:gray;
		text-decoration: none;
		width:100%;
		height:100%;
	}
	#board_list p:hover{
		background-color: #f8f8f8;
	}
	.head{
		background-color: #e8e8e8;
	}
	.head:hover{
		background-color: #e8e8e8 !important;
	}
	#board_list p span{
		display:inline-block;
		width:10%;
		line-height:40px;
		text-align: center;
	}
	#board_list p span:nth-child(2){
		width:30%;
	}
	#board_list p span:nth-child(4){
		width:15%;
	}
		/**************************************************************/
	form{
		text-align: center;
	}
	form>*{
		margin:5px;
		padding:5px;
	}
	form input{
		width:200px;
	}
	form button{
		width:60px;
	}
	#bot{
		text-align: center;
		margin:10px 0;
	}
	#bot a:link, #bot a:visited{
		color:black;
		text-decoration: none;
		display: inline-block;
		padding:5px 0;
		width:30px;
		transition: all 0.1s;
	}
	#bot a:hover{
		box-shadow: 0 0 1px black;
	}
	#bot button{
		float:right;
		padding:5px 10px;
	}
	/*경고창**************************************/
	#alert{
		width:300px;
		height:130px;
		text-align: center;
		padding:20px;
		border:1px solid gray;
		background-color: tomato;
		color:white;
		position:fixed;
		top:100px;
		left:800px;
		display: none;
	}
	#alert button{
		margin:30px;
		padding:5px 20px;
	}

</style>
<script>
	$(function(){
		$("#board_list>p a").click(function(){
			var bno = $(this).parents("span").prev().text();
			location="board_view.jsp?bno="+bno;
		})
		
		$("#bot button").click(function(){
			<%
				if(session.getAttribute("login") != null && (boolean)session.getAttribute("login")){
			%>
			location="board_write_view.jsp";			
			<%
				}else{
			%>
			$("#alert").css("display","block");
			<%}%>
		})
		
		$("#alert button").click(function(){
			location.href="<%=request.getContextPath()%>/member/login.jsp";
		})
	})
	
</script>
</head>
<body>
<jsp:include page="/template/header.jsp"></jsp:include>
<div id="container">
	<div id="board_list">
		 <h2>게시판 목록</h2>
		<form action="">
			<select name="kind">
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">제목+내용</option>
				<option value="4">작성자</option>
			</select>
			<input type="text" name="search">
			<button>검색</button>
		</form>
		<p class="head">
			<span>번호</span>
			<span>제목</span>
			<span>글쓴이</span>
			<span>시간</span>
			<span>조회수</span>
			<span>좋아요</span>
			<span>싫어요</span>
		</p>
		<%
		ArrayList<BoardDTO> li = BoardService.getInstance().selectAll();
		for(int i=li.size()-1; i>=0; i--){
		%>
		<p>
			<span><%=li.get(i).getBno() %></span>
			<span><a href="#"><%=li.get(i).getTitle() %></a></span>
			<span><%=li.get(i).getWriter() %></span>
			<span><%=li.get(i).getbDate() %></span>
			<span><%=li.get(i).getbCount() %></span>
			<span><%=li.get(i).getbLike() %></span>
			<span><%=li.get(i).getbHate() %></span>
		<%} %>
		<div id="bot">
			<a href="#">&lt;&lt;</a>
			<a href="#">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
			<a href="#">5</a>
			<a href="#">&gt;&gt;</a>
			<button type="button">글쓰기</button>
		</div>
		<div id="alert">
			로그인 후 이용하실수 있습니다<br>
			<button type="button">확인</button>		
		</div>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>