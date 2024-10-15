package servlet;

import dao.OrderDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/order")
public class OrderServlet extends HttpServlet implements java.io.Serializable {
    private static final long serialVersionUID = 1L; // Declare serialVersionUID
    private OrderDAO orderDAO = new OrderDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        double total = Double.parseDouble(request.getParameter("total"));

        Order order = new Order();
        order.setUserId(userId);
        order.setTotal(total);

        // Create order and redirect accordingly
        if (orderDAO.createOrder(order)) {
            response.sendRedirect("products.jsp?orderSuccess=true");
        } else {
            response.sendRedirect("cart.jsp?orderError=true");
        }
    }
}

