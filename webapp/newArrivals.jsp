<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>New Arrivals - ChromaCart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%-- Navigation bar here --%>

    <div class="container my-4">
        <h2>New Arrivals</h2>
        <div class="row">
            <%-- Fetch new arrival products from database --%>
            <%-- Example: Repeat for each new product --%>
            <div class="col-md-3">
                <div class="card">
                    <img src="path_to_new_arrival_image.jpg" class="card-img-top" alt="New Arrival 1">
                    <div class="card-body">
                        <h5 class="card-title">New Arrival 1</h5>
                        <p class="card-text">₹ Price</p>
                        <form action="cart.jsp" method="post">
                            <input type="hidden" name="productId" value="productId1">
                            <button type="submit" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
            <%-- Repeat similar blocks for other new arrivals --%>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
