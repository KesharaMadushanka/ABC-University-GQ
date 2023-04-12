package model;

public class Subject {
    private String subjectCode;
    private String subjectName;
    private String subjectDescription;
    private int subjectCredits;

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subject) {
        this.subjectCode = subject;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectDescription() {
        return subjectDescription;
    }

    public void setSubjectDescription(String subjectDescription) {
        this.subjectDescription = subjectDescription;
    }

    public int getSubjectCredits() {
        return subjectCredits;
    }

    public void setSubjectCredits(int subjectCredits) {
        this.subjectCredits = subjectCredits;
    }
}


