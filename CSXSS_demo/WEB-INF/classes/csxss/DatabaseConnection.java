package csxss;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // Change these three to match your MySQL setup
    private static final String URL =
            "jdbc:mysql://localhost:3306/csxss_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "YOUR_REAL_PASSWORD";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL driver not found. Put the connector jar in WEB-INF\\lib.", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}