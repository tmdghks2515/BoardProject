<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//검색할 종류
	String kind = request.getParameter("kind");
	//검색어
	String search = request.getParameter("search");
	
	//검색 결과를 받아서 클라이언트에게 출력 
	if(kind.equals("grade"))
		kind = "grade_name";
	search = search.toUpperCase();
	ArrayList<MemberVO> list = MemberService.getInstance().searchMember(kind,search);
	String result = "";
	for(int i=0;i<list.size();i++){
		result += list.get(i).getId() + " " + list.get(i).getName()
				+ " " + list.get(i).getAge() + " " + list.get(i).getGrade()+",";
		
	}
	out.write(result);	
	
%>





