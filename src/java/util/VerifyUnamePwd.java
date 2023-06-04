package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VerifyUnamePwd {
    public static boolean verifyUname(String uname) throws SQLException {
        Connection con;
        PreparedStatement unameStatement;

        con = DatabaseConnection.connectToDatabase();
        unameStatement = con.prepareStatement("SELECT COUNT(*) FROM users WHERE userName=?");
        //run username check query
        unameStatement.setString(1, uname);
        ResultSet rs = unameStatement.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);
            return count == 0;
        }
        return false;
    }

    public static boolean verifyUemail(String uemail) throws SQLException {
        Connection con;
        PreparedStatement uemailStatement;

        con = DatabaseConnection.connectToDatabase();
        uemailStatement = con.prepareStatement("SELECT COUNT(*) FROM users WHERE userEmail=?");
        //run username check query
        uemailStatement.setString(1, uemail);
        ResultSet rs = uemailStatement.executeQuery();
        if (rs.next()) {
            int count = rs.getInt(1);
            return count == 0;
        }
        return false;
    }


}


