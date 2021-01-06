<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.DBManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String search = "%" + request.getParameter("name") + "%";
	String sql = "select id,name,pass,age,grade_name from member,grade_list where grade=grade_no and name like ? ";
	PreparedStatement pstmt = DBManager.getInstance().getConn().prepareStatement(sql);
	pstmt.setString(1, search);
	ResultSet rs = pstmt.executeQuery();
	
	//JSON 객체 생성
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("search",request.getParameter("name"));
	JSONArray jsonArray = new JSONArray();
	while(rs.next()){
		JSONObject temp = new JSONObject();
		temp.put("id",rs.getString(1));
		temp.put("name",rs.getString(2));
		temp.put("age",rs.getString(4));
		temp.put("grade_name",rs.getString(5));
		jsonArray.put(temp);
	}
	jsonObject.put("result",jsonArray);
	out.write(jsonObject.toString());
	DBManager.getInstance().close(pstmt, rs);
%>