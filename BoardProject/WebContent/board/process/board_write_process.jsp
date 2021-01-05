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
	
	BoardDTO dto2 = BoardService.getInstance().insertBoardDTO(dto);
	session.setAttribute("title", dto2.getTitle());
	session.setAttribute("writer", dto2.getWriter());
	session.setAttribute("content", dto2.getContent());
	session.setAttribute("blike", dto2.getbLike());
	session.setAttribute("bhate", dto2.getbHate());
	session.setAttribute("bdate", dto2.getbDate());
	session.setAttribute("bno", dto2.getBno());
	session.setAttribute("bcount", dto2.getbCount());
	
	response.sendRedirect("../board_view.jsp");
	
%>