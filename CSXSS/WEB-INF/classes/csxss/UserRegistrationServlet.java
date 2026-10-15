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

        String name     = clean(request.getParameter("name"));
        String email    = clean(request.getParameter("mail_id")).toLowerCase();
        String password = request.getParameter("password");   // not trimmed, same as validate.jsp
        String phone    = clean(request.getParameter("phone_number"));
        String yos      = clean(request.getParameter("year_of_study"));
        String college  = clean(request.getParameter("college"));
        String branch   = clean(request.getParameter("branch"));

        String ctx = request.getContextPath();

        if (name.isEmpty() || email.isEmpty() || password == null || password.isEmpty()
                || phone.isEmpty() || yos.isEmpty() || college.isEmpty() || branch.isEmpty()
                || password.length() > 16) {
            response.sendRedirect(ctx + PAGE + "?error=invalid");
            return;
        }

        String sql = "INSERT INTO ssxcs.mastertable "
                   + "(Name, Email, Password, Phone_no, YOS, College_name, Branch) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, yos);
            ps.setString(6, college);
            ps.setString(7, branch);
            ps.executeUpdate();

            response.sendRedirect(ctx + PAGE + "?success=true");

        } catch (SQLException e) {
            log("Registration failed", e);
            response.sendRedirect(ctx + PAGE + "?error=exception");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(request.getContextPath() + PAGE);
    }

    private static String clean(String s) {
        return s == null ? "" : s.trim();
    }
}