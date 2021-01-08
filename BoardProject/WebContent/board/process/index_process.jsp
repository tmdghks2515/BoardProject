<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="dto.BoardDTO"%>
<%@page import="service.BoardService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<BoardDTO> list = BoardService.getInstance().selectAll();
	JSONObject jo = new JSONObject();
	JSONArray ja = new JSONArray();
	for(int i=0; i<list.size(); i++){
		JSONObject temp = new JSONObject();
		temp.put("bno", list.get(i).getBno());
		temp.put("title",list.get(i).getTitle());
		temp.put("writer",list.get(i).getWriter());
		temp.put("bdate",list.get(i).getbDate().substring(0,10));
		temp.put("bcount",list.get(i).getbCount());
		temp.put("blike",list.get(i).getbLike());
		temp.put("bhate",list.get(i).getbHate());
		ja.put(temp);
	}
	jo.put("result", ja);
	out.write(jo.toString());
%>