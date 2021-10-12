
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.crud.dao.MainDAO"%>
<%@page import="com.crud.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<%
	JSONArray listjson = new JSONArray();
	JSONObject obj = new JSONObject();

	int id = Integer.valueOf(request.getParameter("productId"));
	String pName = request.getParameter("pname");
	String category = request.getParameter("category");
	String description = request.getParameter("description");
	double price = Double.valueOf(request.getParameter("price"));
	int quantity = Integer.valueOf(request.getParameter("quantity"));
	int rate = Integer.valueOf(request.getParameter("rate"));
	 System.out.print("rate =========> "+rate);
	Product p = new Product(id,pName, category, description, price, quantity, rate);

	MainDAO.editProduct(p);

	obj.put("name", "success");
	listjson.add(obj);

	out.println(listjson.toJSONString());

	out.flush();
%>
