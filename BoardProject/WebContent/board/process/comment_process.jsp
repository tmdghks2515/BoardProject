<%@page import="service.BoardService"%>
<%@page import="dto.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("bno"));
	String content = request.getParameter("cmt");
	String writer = (String)session.getAttribute("id");
	CommentDTO dto = new CommentDTO(bno, content, writer);
	BoardService.getInstance().insertCommentDTO(dto);
%>