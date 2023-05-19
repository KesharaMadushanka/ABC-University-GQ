package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import static java.lang.Double.isNaN;

public class CalculateGPA {

    private static double gradeValue(String grade) {
        return switch (grade) {
            case "A" -> 4.0;
            case "A-" -> 3.7;
            case "B+" -> 3.3;
            case "B" -> 3.0;
            case "B-" -> 2.7;
            case "C+" -> 2.3;
            case "C" -> 2.0;
            case "C-" -> 1.7;
            case "D+" -> 1.3;
            case "D" -> 1.0;
            case "F" -> 0.0;
            default -> 0;
        };

    }

    public static double gradePointValue(String grade, int credits) {
        return (gradeValue(grade) * credits);

    }

    public static int getTotGP(String studentNumber) {
        Connection conn;
        PreparedStatement pst;

        String sql = "SELECT SUM(grade_point_value) AS total_grade_points FROM student_subject WHERE student_number = ?";
        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = conn.prepareStatement(sql);
            pst.setString(1, studentNumber);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("total_grade_points");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    public static double getGPA(int totalCredits, double gradePointValue) {
        if (isNaN(gradePointValue)){
            return 0;
        }

        double gpa = (gradePointValue / totalCredits);
        DecimalFormat df = new DecimalFormat("#.##");
        return Double.parseDouble(df.format(gpa));

    }

    public static int getTotalCredits(String studentNumber) {

        Connection conn;
        PreparedStatement pst;

        String sql = "SELECT SUM(s.subject_credits) AS total_credits " +
                "FROM subject s JOIN student_subject ss ON s.subject_code " +
                "= ss.subject_code WHERE ss.student_number = ? ";
        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = conn.prepareStatement(sql);
            pst.setString(1, studentNumber);
            ResultSet rs = pst.executeQuery();

            if(rs.next()) {
                return rs.getInt("total_credits");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
}

