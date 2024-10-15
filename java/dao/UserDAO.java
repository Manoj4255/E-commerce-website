package dao;

import model.User;
import util.PasswordUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/ecommerce_db";
    private String jdbcUsername = "root"; // Replace with your MySQL username
    private String jdbcPassword = "123456789"; // Replace with your MySQL password

    // Method to register a new user
    public boolean registerUser(User user) {
        String query = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, user.getUsername());
                statement.setString(2, PasswordUtil.hashPassword(user.getPassword())); // Hash the password
                statement.setString(3, user.getEmail());
                return statement.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method for user login
    public User loginUser(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ?";
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, username);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    String storedHashedPassword = resultSet.getString("password");
                    // Verify the password
                    if (storedHashedPassword.equals(PasswordUtil.hashPassword(password))) {
                        User user = new User();
                        user.setId(resultSet.getInt("id"));
                        user.setUsername(resultSet.getString("username"));
                        user.setEmail(resultSet.getString("email"));
                        return user;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
