package dao;

import model.Order;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class OrderDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/ecommerce_db";
    private String jdbcUsername = "root"; // Replace with your MySQL username
    private String jdbcPassword = "123456789"; // Replace with your MySQL password

    // Method to create a new order
    public boolean createOrder(Order order) {
        String query = "INSERT INTO orders (user_id, total) VALUES (?, ?)";
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, order.getUserId());
                statement.setDouble(2, order.getTotal());
                return statement.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}


