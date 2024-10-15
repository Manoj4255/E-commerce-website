package util;

import javax.servlet.http.HttpSession;
import model.Product;
import java.util.ArrayList;
import java.util.List;

public class SessionUtils {
    
    @SuppressWarnings("unchecked") // Suppress the unchecked cast warning
    public static List<Product> getCart(HttpSession session) {
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        return (cart == null) ? new ArrayList<>() : cart;
    }

    public static void setCart(HttpSession session, List<Product> cart) {
        session.setAttribute("cart", cart);
    }
}
