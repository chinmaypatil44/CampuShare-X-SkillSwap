<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, csxss.DatabaseConnection" %>
<%!
  private static String esc(String s) {
    if (s == null) return "";
    StringBuilder sb = new StringBuilder(s.length() + 16);
    for (char c : s.toCharArray()) {
      switch (c) {
        case '&':  sb.append("&amp;");  break;
        case '<':  sb.append("&lt;");   break;
        case '>':  sb.append("&gt;");   break;
        case '"':  sb.append("&quot;"); break;
        case '\'': sb.append("&#x27;"); break;
        default:   sb.append(c);
      }
    }
    return sb.toString();
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Authentication Status - CampuShare × SkillSwap</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: { extend: { colors: { navBg: '#1E3A8A', iconColor: '#14B8A6' } } }
    }
  </script>
</head>
<body class="bg-gray-50 text-gray-800 font-sans antialiased min-h-screen flex items-center justify-center p-4">

  <div class="max-w-md w-full bg-white p-8 rounded-xl shadow-sm border border-gray-100 text-center">
    <%
      request.setCharacterEncoding("UTF-8");
      String email = request.getParameter("mail_id");
      String password = request.getParameter("password");

      boolean isAuthenticated = false;
      boolean serverError = false;
      String studentName = "";
      String branch = "";
      String college = "";

      if (email != null) email = email.trim().toLowerCase();

      if (email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
        String sql = "SELECT Name, College_name, Branch FROM ssxcs.mastertable WHERE Email = ? AND Password = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

          pstmt.setString(1, email);
          pstmt.setString(2, password);

          try (ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
              isAuthenticated = true;
              studentName = rs.getString("Name");
              college = rs.getString("College_name");
              branch = rs.getString("Branch");

              request.changeSessionId();
              session.setAttribute("userEmail", email);
              session.setAttribute("userName", studentName);
              session.setAttribute("college", college);
              session.setAttribute("branch", branch);
            }
          }
        } catch (Exception e) {
          serverError = true;
          application.log("Login error", e);   // details go to the Tomcat log only
        }
      }
    %>

    <% if (isAuthenticated) { %>
      <div class="w-12 h-12 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-4 text-2xl font-bold">✓</div>
      <h2 class="text-2xl font-bold text-gray-800 mb-1">Welcome, <%= esc(studentName) %>!</h2>
      <p class="text-sm text-gray-500 mb-2"><%= esc(branch) %> &bull; <%= esc(college) %></p>
      <p class="text-xs text-gray-400 mb-6"><%= esc(email) %></p>
      <div class="p-3 bg-emerald-50 text-emerald-700 rounded-md text-sm border border-emerald-200 mb-6">
        Authentication successful. Access granted to CampuShare × SkillSwap.
      </div>
      <a href="HomePg.html" class="inline-block w-full bg-navBg hover:bg-blue-900 text-white font-medium py-3 rounded-md transition-colors text-sm shadow-sm">
        Enter Platform
      </a>
    <% } else { %>
      <div class="w-12 h-12 rounded-full bg-rose-100 text-rose-600 flex items-center justify-center mx-auto mb-4 text-2xl font-bold">✕</div>
      <h2 class="text-2xl font-bold text-gray-800 mb-1">Login Failed</h2>
      <p class="text-sm text-gray-500 mb-6">
        <%= serverError ? "Something went wrong on our side. Please try again later." : "Invalid email address or password." %>
      </p>
      <a href="Login.html" class="inline-block w-full bg-navBg hover:bg-blue-900 text-white font-medium py-3 rounded-md transition-colors text-sm shadow-sm mb-3">
        Try Again
      </a>
      <p class="text-xs text-gray-500">
        Don't have an account? <a href="Registrationpg.html" class="text-iconColor font-semibold hover:underline">Register</a>
      </p>
    <% } %>
  </div>

</body>
</html>