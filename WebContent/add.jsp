 
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.crud.dao.MainDAO"%>
<%@page import="com.crud.model.Product"%>
 
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    JSONArray listjson = new JSONArray();
    JSONObject obj=new JSONObject();

    String pName = request.getParameter("pname");
    String category = request.getParameter("category");
    String description = request.getParameter("description");
    double price = Double.valueOf(request.getParameter("price"));
    int quantity = Integer.valueOf(request.getParameter("quantity"));
    int rate = Integer.valueOf(request.getParameter("rate"));
    
    System.out.print("rate =========> "+rate);
    Product p=new Product(pName, category, description, price, quantity, rate);
    
    MainDAO.addProduct(p);
    
    obj.put("name", "success");
    listjson.add(obj);
    
    out.println(listjson.toJSONString());
     
    out.flush();
    
    
    
    
    

%>