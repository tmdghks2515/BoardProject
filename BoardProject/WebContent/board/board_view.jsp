<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		height:600px;
	}
	#container table{
		border-collapse: collapse;
		margin:30px auto;
	}
	#container tr{
		background-color: #e8e8e8;
		border-top: 1px solid gray;
		border-bottom: 1px solid gray;
	}
	#container th{
		padding: 10px 40px;
	}
	#content{
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div id="container">
		<table>
			<tr>
				<th>글 번호: <%=session.getAttribute("bno") %></th>
				<th>글 제목: <%=session.getAttribute("title") %></th>
				<th>조회수: <%=session.getAttribute("bcount") %></th>
				<th>좋아요: <%=session.getAttribute("blike") %></th>
				<th>싫어요: <%=session.getAttribute("bhate") %></th>
			</tr>
		</table>
		<div id="content">
			<%=session.getAttribute("content") %>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>