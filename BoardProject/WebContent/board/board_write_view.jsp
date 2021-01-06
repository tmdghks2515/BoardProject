<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	if(session.getAttribute("login") != null && (boolean)session.getAttribute("login") == true){
%>
<style>
	#container{
		height: 600px;
	}
	#board{
		width:1200px;
		margin:50px auto;
	}
	#board>*{
		margin:10px 0;
	}
	#board textarea{
		width:600px;
		height:300px;
		resize: none;
	}
	
</style>
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div id="container">
		<div id="board">
			<h3>게시판 글쓰기</h3>
			<form action="process/board_write_process.jsp" method="post">
				<input type="text" name="title" placeholder="글제목"><br>
				<input type="text" name="writer" value="<%=session.getAttribute("id")%>" readonly><br>
				
				<textarea name="content" placeholder="글내용"></textarea><br>
				<button type="button" onclick="location='<%=request.getContextPath()%>/board/board_list_view.jsp'">목록보기</button>
				<button>글쓰기</button>
				<button type="button" onclick="history.back();">뒤로가기</button>
			</form>

		</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>
<%
	}else{
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");	
	}
%>