<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@page import="service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int index = Integer.parseInt(request.getParameter("index"));
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardService.getInstance().LikeHate(bno,index);
	BoardDTO dto = BoardDAO.getInstance().selectBoardDTO(bno);
	if(index == 0)
		out.write(String.valueOf(dto.getbLike()));
	else
		out.write(String.valueOf(dto.getbHate()));
%>