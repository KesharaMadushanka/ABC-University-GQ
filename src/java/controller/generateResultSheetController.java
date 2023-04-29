package controller;

import bean.Student;
import bean.StudentResult;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "generateResultSheet", value = "/ViewResults")
public class generateResultSheetController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con;
        PreparedStatement pstm;
        List<Student> studentList = new ArrayList<>();

        try {
            con = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");

            pstm = con.prepareStatement("SELECT * FROM student");
            ResultSet rst = pstm.executeQuery();


            while (rst.next()) {
                Student student = new Student();
                    student.setId(rst.getInt("id"));

                student.setNumber(rst.getString("student_number"));
                student.setEmail(rst.getString("student_email"));
                student.setName(rst.getString("student_name"));
                student.setNic(rst.getString("student_nic"));
                student.setPhone(rst.getString("student_phone"));
                // Add the user to the list
                studentList.add(student);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

// Your code to retrieve student data goes here

// Loop through each student to generate their result sheet
            for (Student student : studentList) {
                // Generate result sheet using Apache PDFBox
                PDDocument document = new PDDocument();
                PDPage page = new PDPage();
                document.addPage(page);
                PDPageContentStream contentStream = new PDPageContentStream(document, page);

                // Set subject name and code
                contentStream.beginText();
//            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);
                contentStream.newLineAtOffset(100, 700);
                contentStream.showText("Subject: Math - M101");
                contentStream.newLine();
                contentStream.showText("Student Name: " + student.getName());
                contentStream.newLine();
                contentStream.showText("Student Number: " + student.getNumber());
                contentStream.endText();

                // Set results
                List<StudentResult> results = getStudentResults();
                int y = 600;
                assert results != null;
                for (StudentResult result : results) {
                    contentStream.beginText();
//                    contentStream.setFont(PDType1Font.HELVETICA, 12);
                    contentStream.newLineAtOffset(100, y);
                    contentStream.newLine();
                    contentStream.showText("Grade: " + result.getGrade());
                    contentStream.newLine();
                    contentStream.endText();
                    y -= 30;
                }

                // Save and close document
                contentStream.close();
                document.save(student.getNumber() + ".pdf");
                document.close();
            }

// Open PDF in new URL in servlet
            response.sendRedirect(request.getContextPath() + "/result-sheets");

        }


        private List<StudentResult> getStudentResults () {
            Connection conn;
            PreparedStatement pst;

            try {
                conn = DatabaseConnection.connectToDatabase("jdbc:mysql://localhost/abc_university_q", "root", "");
                pst = conn.prepareStatement("SELECT s.student_number, s.student_name, su.subject_code, su.subject_name, ss.grade, sg.gpa " +
                        "FROM student s JOIN student_subject ss ON s.student_number = ss.student_number JOIN subject su " +
                        "ON ss.subject_code = su.subject_code JOIN student_gpa sg ON s.student_number = sg.student_number");

                ResultSet rs = pst.executeQuery();

                List<StudentResult> studentResults = new ArrayList<>();
                while (rs.next()) {
                    StudentResult studentResult = new StudentResult();
                    studentResult.setStudentNumber(rs.getString("student_number"));
                    studentResult.setStudentName(rs.getString("student_name"));
                    studentResult.setSubjectCode(rs.getString("subject_code"));
                    studentResult.setSubjectName(rs.getString("subject_name"));
                    studentResult.setGrade(rs.getString("grade"));
                    studentResult.setGpa(rs.getDouble("gpa"));
                    studentResults.add(studentResult);

                }
                return studentResults;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }


        }
    }
