<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
	#container{
		width:1200px;
		margin:0 auto;
	}
	#board_list{
		margin:20px auto;
	}
	#board_list p{
		height:41.2px;
	}
	#board_list span{
		display:block;
		width:14%;
		padding:10px 0;
		float:left;
		text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="/template/header.jsp"></jsp:include>
<div id="container">
	<div id="board_list">
		<p>
			<span>글번호</span>
			<span>작성자</span>
			<span>글제목</span>
			<span>조회수</span>
			<span>작성일</span>
			<span>좋아요</span>
			<span>싫어요</span>
		</p>
		<%
			
		%>
	</div>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>