<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dto.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.BoardService"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<style>
	#container{
		width:1200px;
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
	.dash{
		margin: 0 60px;
		text-decoration: none;
	}
	#content{
		height:500px;
	}
	/*댓글******************************************/
	#comment{
		padding:0;
		border:1px solid #d1d1d1;
		width:1000px;
		margin:10px auto;
		height:247px;
	}
	#comment textarea{
		border:none;
		outline: none;
		resize: none;
		width:96%;
		height:100px;
		margin:0 15px;
		font-size: 16px;
	}
	#comment small{
		display:inline-block;
		margin:15px;
		font-weight: bold;
	}
	#comment a:link,#comment a:visited{
		width:80px;
		line-height:50px;
		background-color:#00CC00 ;
		color:white;
		text-decoration: none;
		text-align: center;
		display: block;
		float:right;
	}
	#comment p{
		border-bottom:1px solid #d1d1d1;
		margin:0;
		text-align: right;
		padding:10px;
	}
	/*댓글목록************************************************************/
	.comment_list{
		border-bottom:1px solid gray;
		width:1000px;
		margin:10px auto;
	}
	.comment_list span:first-of-type{
		margin-left:700px;
		margin-right:30px;
	}
</style>
	<%
		if(session.getAttribute("login") != null && (boolean)session.getAttribute("login"));
		String name = (String)session.getAttribute("name");
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDTO dto = BoardService.getInstance().selectBoardDTO(bno);
	%>
	<%! 		
		public String dateDiff(String date){
			String result = "";
			Date today = new Date();
			try{
				SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date comment_date = format1.parse(date);
				long diff = today.getTime() - comment_date.getTime();
				long sec = diff/1000;
				if(sec < 60)
					result=sec+"초 전";
				else if(sec < 60*60)
					result=sec/60+"분 전";
				else if(sec < 60*60*24)
					result=sec/(60*60)+"시간 전";
				else if(sec < 60*60*24*30)
					result=sec/(60*60*24)+"일 전";
				else if(sec < 60*60*24*30*365)
					result=sec/(60*60*24*30)+"달 전";
				else
					result=sec/(60*60*24*30*365)+"년 전";
			}catch(ParseException e){
				
			}
			
			return result;
		}
	%>
<script>
	$(function(){
		$("#btns img").click(function(){
			var index = $("#btns img").index(this);
			var bno = <%=dto.getBno()%>;
			<%
				if(session.getAttribute("login") != null && (boolean)session.getAttribute("login")){
			%>
			var data = "index="+index+"&bno="+bno;
			$.ajax({
				url:'process/board_like_hate_process.jsp',
				data:data,
				method:'get',
				success:function(d){
					$("th span").eq(index).html(d);			
				}
			})
			<%
			}else{
				session.setAttribute("url", request.getRequestURI()+"?"+request.getQueryString());
			%>
			alert("로그인이 필요합니다.");
			location = "<%=request.getContextPath()%>/member/login.jsp";
			<%}%>
		})
		
		$("#cmt").keydown(function(){
			var txt = $("#cmt").eq(0).val().length+"/500";
			$(".length").text(txt);
		})
		
		$("#comment form a").click(function(){
			var data = $("#frm").serialize();
			$.ajax({
				data:data,
				url:"process/comment_process.jsp",
				method:'get',
				success:function(d){
					location.reload();
				}
			})
		})
	})
</script>
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div id="container">
		<table>
			<tr>
				<th>글 번호: <%=dto.getBno()%></th>
				<th>글 제목: <%=dto.getTitle()%></th>
				<th>작성자: <%=dto.getWriter() %>
				<th>조회수: <%=dto.getbCount() %></th>
				<th>작성일: <%=dto.getbDate() %></th>
				<th>좋아요: <span><%=dto.getbLike() %></span></th>
				<th>싫어요: <span><%=dto.getbHate()%></span></th>
			</tr>
		</table>
		<div id="content">
			<%=dto.getContent() %>
		</div>
		<br><hr>
		<div id="btns">
			<%
				if(session.getAttribute("id") != null && session.getAttribute("id").equals(dto.getWriter())){
			%>
			<button type="button">수정</button>
			<button type="button">삭제</button>
			<%} %>
			<a href="<%=request.getContextPath() %>/board/board_view.jsp?bno=<%=bno-1 %>" class="dash">이전글</a>
			좋아요 <a href="#"><img src="<%=request.getContextPath()%>/img/like.png"></a>
			싫어요 <a href="#"><img src="<%=request.getContextPath()%>/img/hate.png"></a>
			<a href="board_view.jsp?bno=<%=bno+1 %>" class="dash">다음글</a>
			<button type="button" onclick="location='board_list_view.jsp'">목록보기</button>
		</div>
		<hr>
		<%if(session.getAttribute("login") != null && (boolean)session.getAttribute("login")) {%>
		<div id="comment">
			<form id="frm">
				<input type="hidden" name="bno" value="<%=bno%>">
				<input type="hidden" name="writer" value="<%=name%>">
				<small><%=name%></small><br>
				<textarea id="cmt" name="cmt" maxlength="500" placeholder="주제와 무관한 댓글이나 스포일러, 악플은 경고조치 없이 삭제되며 징계대상이 될 수 있습니다."></textarea>
				<p class="length">0/500</p>
				<a href="#">등록</a>
			</form>
		</div>
		<%}
			ArrayList<CommentDTO> li = BoardService.getInstance().selectComments(bno);
			for(CommentDTO cmt : li){
		%>
		<div class="comment_list">
			<p><%=cmt.getWriter() %></p>
			<p><%=cmt.getContent() %></p>
			<p><small><%=dateDiff(cmt.getcDate()) %></small><span><a href="#">좋아요</a>:<%=cmt.getcLike() %></span><span><a href="#">싫어요</a>:<%=cmt.getcHate() %></span></p>
		</div>
		<%} %>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>