package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

public class UserAuthorization {
    private static String checkPrivilege(String username) {
        Connection con;
        PreparedStatement pst;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT userRole FROM users WHERE username = ?");
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String userRole = rs.getString("userRole");
                //check if user is admin
                if (Objects.equals(userRole, "admin")) {
                    return "admin";
                }
                //check if user is a student
                else if (Objects.equals(userRole, "user")) {
                    return "user";
                }
            } else {
                //no role assigned
                return ("No role assigned");
            }
        } catch (SQLException e) {
            return "Something went wrong";
        }
        return null;
    }

    //method public access
    public static String authorizeUser(String username) {
        return checkPrivilege(username);
    }

}
