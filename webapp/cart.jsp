<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="util.SessionUtils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Cart - ChromaCart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-4">
        <h2>My Cart</h2>
        <div class="row">
            <%
                List<Product> cart = SessionUtils.getCart(session); // Ensure this returns the cart products
                if (cart.isEmpty()) {
                    out.println("<p>Your cart is empty.</p>");
                } else {
                    for (Product product : cart) {
            %>
                <div class="col-md-3 product-card">
                    <div class="card">
                        <img src="<%= product.getImageUrl() %>" class="card-img-top" alt="<%= product.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <p class="card-text">₹<%= product.getPrice() %></p>
                            <form action="removeFromCart.jsp" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <button type="submit" class="btn btn-danger">Remove from Cart</button>
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
