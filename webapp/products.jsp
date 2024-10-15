<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %> <!-- Adjust the package name as needed -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Commerce App - ChromaCart</title>

    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <style>
        /* Add your existing styles here */
        .main-navbar {
            border-bottom: 1px solid #ccc;
        }
        .main-navbar .top-navbar {
            background-color: #2874f0;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .main-navbar .top-navbar .brand-name {
            color: #fff;
            display: inline-flex;
            align-items: center;
        }
        .main-navbar .top-navbar .brand-name img {
            width: 20px; /* Adjust size as needed */
            margin-right: 8px; /* Space between flag and brand name */
        }
        .main-navbar .top-navbar .nav-link {
            color: #fff;
            font-size: 16px;
            font-weight: 500;
        }
        .product-card {
            margin: 15px 0;
        }
        .carousel-item img {
            width: 100%; /* Ensures images fill the carousel */
            height: auto; /* Maintain aspect ratio */
        }
    </style>
</head>
<body>

    <div class="main-navbar shadow-sm sticky-top">
        <div class="top-navbar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2 my-auto d-none d-sm-none d-md-block d-lg-block">
                        <h5 class="brand-name">
                            <img src="https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg" alt="Indian Flag"> 
                            ChromaCart
                        </h5>
                    </div>
                    <div class="col-md-5 my-auto">
                        <form action="products.jsp" method="GET" role="search"> <!-- Ensure the search form submits to this page -->
                            <div class="input-group">
                                <input type="search" name="searchQuery" placeholder="Search your product" class="form-control" />
                                <button class="btn bg-white" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-5 my-auto">
                        <ul class="nav justify-content-end">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fa fa-shopping-cart"></i> Cart (0)
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fa fa-heart"></i> Wishlist (0)
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-user"></i> Username 
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#"><i class="fa fa-user"></i> Profile</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fa fa-list"></i> My Orders</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fa fa-heart"></i> My Wishlist</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fa fa-shopping-cart"></i> My Cart</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fa fa-sign-out"></i> Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand d-block d-sm-block d-md-none d-lg-none" href="#">
                    ChromaCart
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">All Categories</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">New Arrivals</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Featured Products</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Electronics</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Fashions</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Accessories</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Appliances</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <!-- Slider for Deals -->
    <div id="dealCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="https://www.amazon.in/dp/B08N5WRWNZ" target="_blank">
                    <img alt="Deal 1" src="https://m.media-amazon.com/images/I/71Ie3JXGfVL._SX3000_.jpg">
                </a>
            </div>
            <div class="carousel-item">
                <a href="https://www.amazon.in/dp/B08KH3SYH2" target="_blank">
                    <img alt="Deal 2" src="https://m.media-amazon.com/images/I/81KkrQWEHIL._SX3000_.jpg">
                </a>
            </div>
            <div class="carousel-item">
                <a href="https://www.amazon.in/dp/B08Y7D8J7T" target="_blank">
                    <img alt="Deal 3" src="https://m.media-amazon.com/images/I/61zAjw4bqPL._SX3000_.jpg">
                </a>
            </div>
            <div class="carousel-item">
                <a href="https://www.amazon.in/dp/B08BGHYBWN" target="_blank">
                    <img alt="Deal 4" src="https://m.media-amazon.com/images/I/71qcoYgEhzL._SX3000_.jpg">
                </a>
            </div>
        </div>
    </div>

    <!-- Products Section -->
    <div class="container my-4">
        <h2>Featured Products</h2>
        <div class="row">
            <%
                // Database connection parameters
                String dbURL = "jdbc:mysql://localhost:3306/ecommerce_db";
                String dbUser = "root";
                String dbPass = "123456789";
                List<Product> products = new ArrayList<>();
                
                String searchQuery = request.getParameter("searchQuery"); // Get the search query if exists
                String sql = "SELECT id, name, price, image_url FROM products";

                // Modify SQL query if there is a search query
                if (searchQuery != null && !searchQuery.isEmpty()) {
                    sql += " WHERE name LIKE '%" + searchQuery + "%'"; // Search by product name
                }

                // Limit the number of results displayed
                sql += " LIMIT 20"; // Show 20 products

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
                    Statement statement = connection.createStatement();
                    ResultSet rs = statement.executeQuery(sql);
                    
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
                    e.printStackTrace();
                }
                
                for (Product product : products) {
            %>
                <div class="col-md-3 product-card">
                    <div class="card">
                        <a href="productDetail.jsp?id=<%= product.getId() %>"> <!-- Link to product details -->
                            <img src="<%= product.getImageUrl() %>" class="card-img-top" alt="<%= product.getName() %>">
                        </a>
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
            %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
