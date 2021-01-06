<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
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
		width:1200px;
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
		width:1200px;
		margin:0 auto;
		padding:10px;
		box-sizing: border-box;
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
				<th>조회수: <%=dto.getbCount() %></th>
				<th>좋아요: <%=dto.getbLike() %></th>
				<th>싫어요: <%=dto.getbHate()%></th>
			</tr>
		</table>
		<div id="content">
			<%=dto.getContent() %>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>