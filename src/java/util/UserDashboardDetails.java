package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDashboardDetails {
    static Connection con;

    //get first class student count
    public static int getFirstClassStudentCount() {
        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM student_gpa WHERE gpa >= 3.70");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("count");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }

    }

    //total student count with classes
    public static int getClassStudentCount() {
        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM student_gpa WHERE gpa >= 3");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("count");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }

    }

    //graded student count
    public static int getGradedStudentCount() {
        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM student_subject WHERE grade != ''");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("count");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    //not graded count
    public static int getNoGradedStudentCount() {
        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM student_subject WHERE grade = ''");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("count");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }


    //need to enroll count
    public static int getNeedToEnrollCount() {
        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM student WHERE student_number " +
                    "NOT IN ( SELECT student_number FROM student_subject );");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("count");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    //already enrolled count
    public static int getEnrolledCount() {
        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM student WHERE student_number " +
                    "IN ( SELECT student_number FROM student_subject );");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("count");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    //Most student failed subject
    public static String getFailedSubject() {
        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("SELECT subject_name FROM subject WHERE subject_code = " +
                    "( SELECT subject_code FROM student_subject WHERE grade = 'F' GROUP BY subject_code ORDER BY COUNT(*) " +
                    "DESC LIMIT 1 ); ");
            rs = pst.executeQuery();


            if (rs.next()) {
                return rs.getString("subject_name");
            } else {
                return "";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return "";
        }
    }

    //Most student failed subject count
    public static int getFailedSubjectCount() {
        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase();
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM " +
                    "(SELECT subject_name FROM subject WHERE subject_code = " +
                    "(SELECT subject_code FROM student_subject WHERE grade = 'F' " +
                    "GROUP BY subject_code ORDER BY COUNT(*) DESC LIMIT 1)) AS subquery;");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("count");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }


}
