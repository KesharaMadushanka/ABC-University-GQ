package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DatabaseConnection {
    private static final String url = "jdbc:mysql://localhost/abc_university_q";
    private static final String username = "root";
    private static final String password = "";


    public static Connection connectToDatabase()
            throws SQLException {
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            System.out.println("Could not find MySQL JDBC driver");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Could not connect to database");
            e.printStackTrace();
        }
        return connection;
    }

}
