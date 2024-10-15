package servlet;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/user")
public class UserServlet extends HttpServlet implements java.io.Serializable {
    private static final long serialVersionUID = 1L; // Recommended to declare serialVersionUID
    private static final Logger logger = Logger.getLogger(UserServlet.class.getName());
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("register".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");

            // Logging statements
            logger.info("Register Action Triggered");
            logger.info("Username: " + username);
            logger.info("Password: " + password); // Caution: Do not log plain passwords in production
            logger.info("Email: " + email);

            User user = new User();
            user.setUsername(username);
            user.setPassword(password); // Storing the plain password temporarily for hashing
            user.setEmail(email);

            if (userDAO.registerUser(user)) {
                logger.info("Registration successful for user: " + username);
                response.sendRedirect("login.jsp");
            } else {
                logger.warning("Registration failed for user: " + username);
                response.sendRedirect("register.jsp?error=true");
            }
        } else if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            logger.info("Login Action Triggered");
            logger.info("Username: " + username);
            logger.info("Password: " + password); // Caution: Do not log plain passwords in production

            User user = userDAO.loginUser(username, password);
            if (user != null) {
                logger.info("Login successful for user: " + username);
                request.getSession().setAttribute("user", user);
                response.sendRedirect("products.jsp");
            } else {
                logger.warning("Login failed for user: " + username);
                response.sendRedirect("login.jsp?error=true");
            }
        }
    }
}
