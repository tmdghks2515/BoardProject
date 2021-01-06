<%@page import="dto.BoardDTO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../../error/error.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	BoardDTO dto = new BoardDTO(title,writer,content);
	
	dto = BoardService.getInstance().insertBoardDTO(dto);
	response.sendRedirect("../board_view.jsp?bno="+dto.getBno());
%>