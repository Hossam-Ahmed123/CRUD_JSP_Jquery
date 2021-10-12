 

<%@page import="com.crud.model.Product"%>
<%@page import="com.crud.dao.MainDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%
    JSONArray listjson = new JSONArray();

    MainDAO.viewProduct();

    for (Product product : MainDAO.viewProduct()) {
        JSONObject obj = new JSONObject();
        obj.put("id", product.getId());
        obj.put("name", product.getName());
        obj.put("category", product.getCategory());
        obj.put("description", product.getDescription());
        obj.put("price", product.getPrice());
        obj.put("quan", product.getQuantity());
        obj.put("rate", product.getRate());
        listjson.add(obj);
    }

    out.println(listjson.toJSONString());

    out.flush();


%>