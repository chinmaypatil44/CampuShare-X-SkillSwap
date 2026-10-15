package csxss;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/MasterTableServlet")
public class MasterTableServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"en\"><head><meta charset=\"UTF-8\">");
        out.println("<title>Registered Users Database</title>");
        out.println("<style>");
        out.println("body{font-family:Segoe UI,Arial,sans-serif;margin:2rem;color:#1f2933}");
        out.println("table{border-collapse:collapse;min-width:480px}");
        out.println("th,td{border:1px solid #cbd2d9;padding:8px 14px;text-align:left}");
        out.println("th{background:#e4e7eb}");
        out.println("</style></head><body>");
        out.println("<h1>Registered users</h1>");

        String sql = "SELECT id, name, email, city FROM users ORDER BY id";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            out.println("<table>");
            out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>City</th></tr>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + esc(rs.getString("name")) + "</td>");
                out.println("<td>" + esc(rs.getString("email")) + "</td>");
                out.println("<td>" + esc(rs.getString("city")) + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

        } catch (SQLException e) {
            log("Could not load users", e);
            out.println("<p>Could not load users. Check the Tomcat logs.</p>");
        }

        out.println("<p><a href=\"" + request.getContextPath() + "/Registrationpg.html\">Back to registration</a></p>");
        out.println("</body></html>");
    }

    // Escape user data before writing it into HTML (prevents stored XSS)
    private static String esc(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#x27;");
    }
}