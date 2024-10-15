package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CartItem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

// Servlet for adding items to cart
@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Get the session object
        HttpSession session = request.getSession();
        
        // Retrieve the cart from the session safely
        @SuppressWarnings("unchecked") // Suppress the unchecked cast warning
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        // If the cart does not exist, create a new one
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Add the new item to the cart
        cart.add(new CartItem(productId, productName, productPrice, quantity));

        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }
}
