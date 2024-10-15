package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Iterator;
import model.CartItem;

@WebServlet("/removeItem")
public class RemoveItemServlet extends HttpServlet implements java.io.Serializable { // Implement Serializable
    private static final long serialVersionUID = 1L; // Declare serialVersionUID

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) request.getSession().getAttribute("cart");

        if (cart != null && productId != null) {
            Iterator<CartItem> iterator = cart.iterator();
            while (iterator.hasNext()) {
                CartItem item = iterator.next();
                if (item.getId().equals(productId)) {
                    iterator.remove();
                    break;
                }
            }
        }

        response.sendRedirect("cart.jsp");
    }
}
