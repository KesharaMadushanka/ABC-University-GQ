package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DashboardDetails {

    static Connection con;

    //get student count
    public static int getStudentCount() {

        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM student");
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

    //get new student count
    public static int getNewStudentCount() {

        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM student_gpa WHERE gpa = 0");
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

    //get user count
    public static int getUserCount() {

        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM users WHERE userRole = 'user'");
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

    //get admin count
    public static int getAdminCount() {

        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM users WHERE userRole = 'admin'");
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

    //get degree count
    public static int getDegreeCount() {

        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM degree");
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

    //get subject count
    public static int getSubjectCount() {

        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT COUNT(*) AS count FROM subject");
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


    //get most student follow degree name
    public static String getMostFollowDegreeName() {

        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT d.degree_name, COUNT(*) AS student_count FROM student_subject ss " +
                    "JOIN degree_subject ds ON ss.subject_code = ds.subject_code " +
                    "JOIN degree d ON ds.degree_code = d.degree_code " +
                    "GROUP BY d.degree_name " +
                    "ORDER BY student_count DESC LIMIT 1; ");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getString("degree_name");
            } else {
                return "";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return "";
        }

    }

    //get most student follow degree count
    public static int getMostFollowDegreeCount() {

        PreparedStatement pst;
        ResultSet rs;

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
            pst = con.prepareStatement("SELECT COUNT(*) AS student_count FROM student_subject ss " +
                    "JOIN degree_subject ds ON ss.subject_code = ds.subject_code JOIN degree d ON ds.degree_code = d.degree_code " +
                    "GROUP BY d.degree_name ORDER BY student_count DESC LIMIT 1; ");
            rs = pst.executeQuery();

            if (rs.next()) {
                return rs.getInt("student_count");
            } else {
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }

    }

}
