<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="util.SessionUtils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Adding to Cart - ChromaCart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-4">
        <%
            String productId = request.getParameter("productId");
            Product product = null;

            // Fetch product details from the database
            String dbURL = "jdbc:mysql://localhost:3306/ecommerce_db";
            String dbUser = "root";
            String dbPass = "123456789";
            List<Product> cart = SessionUtils.getCart(session);

            if (cart == null) {
                cart = new ArrayList<>();
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                String sql = "SELECT id, name, price, image_url FROM products WHERE id = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, Integer.parseInt(productId));
                ResultSet rs = preparedStatement.executeQuery();

                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImageUrl(rs.getString("image_url"));
                }

                connection.close();
            } catch (Exception e) {
                e.printStackTrace(); // Consider logging this in production
            }

            if (product != null) {
                cart.add(product);
                SessionUtils.setCart(session, cart); // Save the updated cart in the session
                out.println("<p>Product added to cart successfully!</p>");
            } else {
                out.println("<p>Error: Product not found.</p>");
            }
        %>
        <a href="cart.jsp" class="btn btn-primary">View Cart</a>
        <a href="index.jsp" class="btn btn-secondary">Continue Shopping</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
