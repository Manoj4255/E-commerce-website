<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search Results - ChromaCart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-4">
        <h2>Search Results</h2>
        <div class="row">
            <%
                String dbURL = "jdbc:mysql://localhost:3306/ecommerce_db";
                String dbUser = "root";
                String dbPass = "123456789";
                List<Product> products = new ArrayList<>();
                String query = request.getParameter("query");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    String sql = "SELECT id, name, price, image_url FROM products WHERE name LIKE ?";
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, "%" + query + "%");
                    ResultSet rs = preparedStatement.executeQuery();
                    
                    while (rs.next()) {
                        Product product = new Product();
                        product.setId(rs.getInt("id"));
                        product.setName(rs.getString("name"));
                        product.setPrice(rs.getDouble("price"));
                        product.setImageUrl(rs.getString("image_url"));
                        products.add(product);
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace(); // Consider logging this in production
                }

                if (products.isEmpty()) {
                    out.println("<p>No products found matching your search.</p>");
                } else {
                    for (Product product : products) {
            %>
                <div class="col-md-3 product-card">
                    <div class="card">
                        <img src="<%= product.getImageUrl() %>" class="card-img-top" alt="<%= product.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <p class="card-text">₹<%= product.getPrice() %></p>
                            <form action="cart.jsp" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
