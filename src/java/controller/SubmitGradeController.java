package controller;

import util.CalculateGPA;
import util.CheckGPA;
import util.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import static java.lang.Double.isNaN;

@WebServlet(name = "SubmitGradeController", value = "/SubmitGradeController")
public class SubmitGradeController extends HttpServlet {

    Connection conn;
    PreparedStatement pst, creditSt, gradePointValueSt, gpaSt;
    ResultSet creditRs;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subjectCode = request.getParameter("subjectCode");
        try {
            conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            Enumeration<String> parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements()) {

                String paramName = parameterNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);

                if (paramValues.length > 0 && !"disabled".equals(paramValues[0])) {
                    String grade = paramValues[0];


                    pst = conn.prepareStatement("UPDATE student_subject SET grade = ? WHERE student_number = ? AND subject_code = ?");
                    pst.setString(1, grade);
                    pst.setString(2, paramName);
                    pst.setString(3, subjectCode);
                    pst.executeUpdate();


                    //get the subject credit
                    creditSt = conn.prepareStatement("SELECT subject_credits FROM subject WHERE subject_code = ?");
                    creditSt.setString(1, subjectCode);
                    int credit = 0;
                    try (ResultSet rs = creditSt.executeQuery()) {
                        if (rs.next()) {
                            credit = rs.getInt("subject_credits");
                        }
                    }
                    //                    calculate the grade point value
                    double gradePointValue = CalculateGPA.gradePointValue(grade, credit);
//                    save the grade point value
                    gradePointValueSt = conn.prepareStatement("UPDATE student_subject SET grade_point_value = ? " +
                            "WHERE student_number = ? AND subject_code = ?");
                    gradePointValueSt.setDouble(1, gradePointValue);
                    gradePointValueSt.setString(2, paramName);
                    gradePointValueSt.setString(3, subjectCode);
                    gradePointValueSt.executeUpdate();

                    System.out.println((CheckGPA.isAllGraded(paramName)));
                    //calculate GPA if the all subjects graded
                    if (CheckGPA.isAllGraded(paramName)) {
                        //total credits for each student
                        int totalCredits = CalculateGPA.getTotalCredits(paramName);
                        //calculate the GPA
                        double gpa = CalculateGPA.getGPA(totalCredits, gradePointValue);
                        if (!isNaN(gpa)){
                            //save GPA in the db
                            gpaSt = conn.prepareStatement("UPDATE student_gpa SET gpa = ? WHERE student_number = ?");
                            gpaSt.setDouble(1, gpa);
                            gpaSt.setString(2, paramName);
                            gpaSt.executeUpdate();
                        }

                    }


                }
            }


            // redirect to a success page
            response.sendRedirect(request.getContextPath() + "/StudentGrade?success=true&subjectCode=" + subjectCode);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/StudentGrade?success=false&subjectCode=" + subjectCode);
        }


    }

}

