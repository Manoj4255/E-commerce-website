<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Categories - ChromaCart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%-- Navigation bar here --%>

    <div class="container my-4">
        <h2>All Categories</h2>
        <div class="row">
            <%-- Sample categories --%>
            <div class="col-md-3">
                <div class="card">
                    <img src="path_to_category_image1.jpg" class="card-img-top" alt="Category 1">
                    <div class="card-body">
                        <h5 class="card-title">Category 1</h5>
                        <a href="categoryPage1.jsp" class="btn btn-primary">View Products</a>
                    </div>
                </div>
            </div>
            <%-- Repeat similar blocks for other categories --%>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
