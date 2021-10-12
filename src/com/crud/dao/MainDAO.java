package com.crud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

import com.crud.connection.ConnectionFactory;
import com.crud.model.Product;
import java.sql.CallableStatement;

public class MainDAO {

	public static Connection connection = null;
	public static CallableStatement calltmt = null;
	public static PreparedStatement ptmt = null;
	public static ResultSet resultSet = null;

	private static Connection getConnection() throws SQLException {
		Connection conn;
		conn = ConnectionFactory.getInstance().getConnection();
		return conn;
	}

	public static String addProduct(Product product) throws SQLException {

//        String queryString = "SELECT curd.SaveProduct(:p_name,:p_category,:p_description,:p_code,:p_price,:p_quntity,:p_rate)";
		boolean val = true;
		String queryString = "{? = CALL curd.SaveProduct(?,?,?,?,?,?,?)}";
		connection = getConnection();
		calltmt = connection.prepareCall(queryString);
		calltmt.registerOutParameter(1, Types.INTEGER);
		calltmt.setString(2, product.getName());

		calltmt.setString(3, product.getCategory());
		calltmt.setString(4, product.getDescription());
		calltmt.setString(5, "122");
		calltmt.setDouble(6, product.getPrice());
		calltmt.setInt(7, product.getQuantity());
		calltmt.setInt(8, product.getQuantity());

		val = calltmt.execute();
		System.out.println(val);
		if (val == false) {
			return "Done Insert";
		} else {

			return "Error ";
		}
	}

	public static String editProduct(Product product) throws SQLException {

//		{ SELECT curd.updateProduct(:p_id,:p_name,:p_category,:p_description,:p_code,:p_price,:p_quntity,:p_rate) }
		String queryString = "{? = CALL curd.updateProduct(?,?,?,?,?,?,?,?)}";
		connection = getConnection();
		calltmt = connection.prepareCall(queryString);
		calltmt.registerOutParameter(1, Types.INTEGER);
		calltmt.setInt(2, product.getId());
		calltmt.setString(3, product.getName());

		calltmt.setString(4, product.getCategory());
		calltmt.setString(5, product.getDescription());
		calltmt.setString(6, "122");
		calltmt.setDouble(7, product.getPrice());
		calltmt.setInt(8, product.getQuantity());
		calltmt.setInt(9, product.getRate());
		System.out.println("result ---> ");
		boolean val = calltmt.execute();
		System.out.println("result ---> " + val);
//		if (val >0) {
//			return "Done Insert";
//		} else {
//
//			return "Error ";
//		}

		return null;
	}

	public static String deleteProduct(int id) throws SQLException {

//      String queryString = "SELECT curd.SaveProduct(:p_name,:p_category,:p_description,:p_code,:p_price,:p_quntity,:p_rate)";
		boolean val = true;
		String queryString = "{? = CALL curd.deleteProduct(?)}";
		connection = getConnection();
		calltmt = connection.prepareCall(queryString);
		calltmt.registerOutParameter(1, Types.INTEGER);
		calltmt.setInt(2, id);

		val = calltmt.execute();
		System.out.println(val);
		if (val == false) {
			return "Done Insert";
		} else {

			return "Error ";
		}
	}

	public static ArrayList<Product> viewProductByID(int id) throws SQLException {

//      String queryString = "SELECT curd.SaveProduct(:p_name,:p_category,:p_description,:p_code,:p_price,:p_quntity,:p_rate)";
		String queryString = "{CALL curd.`getProductbyId`(?)}";
		connection = getConnection();
		calltmt = connection.prepareCall(queryString);
		calltmt.setInt(1, id);
		resultSet = calltmt.executeQuery();

		ArrayList<Product> list = new ArrayList<Product>();
		while (resultSet.next()) {
			Product product = new Product(resultSet.getInt(1), resultSet.getString("name"),
					resultSet.getString("category"), resultSet.getString("description"), resultSet.getDouble("price"),
					resultSet.getInt("quantity"), resultSet.getInt("rating"));

			list.add(product);

		}

		return list;
	}

	public static ArrayList<Product> viewProduct() throws SQLException {

//      String queryString = "SELECT curd.SaveProduct(:p_name,:p_category,:p_description,:p_code,:p_price,:p_quntity,:p_rate)";

		String queryString = "{CALL curd.`GetAllProducts`()}";
		connection = getConnection();
		calltmt = connection.prepareCall(queryString);

		resultSet = calltmt.executeQuery();

		ArrayList<Product> list = new ArrayList<Product>();
		while (resultSet.next()) {
			Product product = new Product(resultSet.getInt(1), resultSet.getString("name"),
					resultSet.getString("category"), resultSet.getString("description"), resultSet.getDouble("price"),
					resultSet.getInt("quantity"), resultSet.getInt("rating"));

			list.add(product);

		}

		return list;
	}

	public static void main(String[] args) throws SQLException {

		Product product = new Product(36, "Hossam", "cccccccccccccc", "cccddd", 15, 4, 9);

		for (Product string : viewProduct()) {
			System.out.println(string.getDescription());
		}

	}
}
