package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckGPA {
    public static boolean isAllGraded(String studentNumber){
        try {
            Connection conn;
            PreparedStatement pst;
            ResultSet rs;

            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = conn.prepareStatement("SELECT grade FROM student_subject WHERE student_number = ? AND grade = ''");
            pst.setString(1, studentNumber);
            rs = pst.executeQuery();

            return !rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
