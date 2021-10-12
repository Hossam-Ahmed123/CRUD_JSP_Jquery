<%-- 
    Document   : edit
    Created on : Oct 11, 2021, 6:01:37 PM
    Author     : space
--%>

<%@page import="com.crud.dao.MainDAO"%>
<%@page import="com.crud.model.Product"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    JSONArray listjson = new JSONArray();
    int id = Integer.valueOf(request.getParameter("id"));
      System.out.println(id);
     for (Product product : MainDAO.viewProductByID(id)) {
        JSONObject obj = new JSONObject();
        obj.put("id", product.getId());
        obj.put("name", product.getName());
        obj.put("category", product.getCategory());
        obj.put("description", product.getDescription());
        obj.put("price", product.getPrice());
        obj.put("quan", product.getQuantity());
        obj.put("rate", product.getRate());
        
        
        System.out.println("Product Name  --- >"+product.getName());
       
        listjson.add(obj);
        
        
         
    }

    out.print(listjson.toJSONString());

    out.flush();


%>

