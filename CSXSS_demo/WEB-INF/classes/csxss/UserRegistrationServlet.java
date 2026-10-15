package csxss;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {

    private static final String PAGE = "/Registrationpg.html";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");

        String name = clean(request.getParameter("name"));
        String email = clean(request.getParameter("email"));
        String city = clean(request.getParameter("city"));

        String ctx = request.getContextPath();

        if (name.isEmpty() || email.isEmpty()) {
            response.sendRedirect(ctx + PAGE + "?error=invalid");
            return;
        }

        String sql = "INSERT INTO users (name, email, city) VALUES (?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, city);
            ps.executeUpdate();

            response.sendRedirect(ctx + PAGE + "?success=true");

        } catch (SQLException e) {
            log("Registration failed", e);
            response.sendRedirect(ctx + PAGE + "?error=exception");
        }
    }

    // Typing the servlet URL in the browser sends a GET; send it back to the form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(request.getContextPath() + PAGE);
    }

    private static String clean(String s) {
        return s == null ? "" : s.trim();
    }
}