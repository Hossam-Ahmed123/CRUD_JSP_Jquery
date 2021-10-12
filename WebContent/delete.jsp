<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.crud.dao.MainDAO"%>
<%@page import="com.crud.model.Product"%>

<%
	JSONArray listjson = new JSONArray();
	JSONObject obj = new JSONObject();
	String id = request.getParameter("id");

	MainDAO.deleteProduct(Integer.valueOf(id));

	obj.put("name", "success");
	listjson.add(obj);

	out.println(listjson.toJSONString());

	out.flush();
%>