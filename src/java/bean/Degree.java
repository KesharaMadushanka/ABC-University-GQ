package bean;

public class Degree {
    private String degreeCode;
    private String degreeName;
    private String degreeDescription;
    private int degreeDuration;
    private int degreeCredits;

    public String getDegreeCode() {
        return degreeCode;
    }

    public void setDegreeCode(String degreeCode) {
        this.degreeCode = degreeCode;
    }

    public String getDegreeName() {
        return degreeName;
    }

    public void setDegreeName(String degreeName) {
        this.degreeName = degreeName;
    }

    public String getDegreeDescription() {
        return degreeDescription;
    }

    public void setDegreeDescription(String degreeDescription) {
        this.degreeDescription = degreeDescription;
    }

    public int getDegreeDuration() {
        return degreeDuration;
    }

    public void setDegreeDuration(int degreeDuration) {
        this.degreeDuration = degreeDuration;
    }

    public int getDegreeCredits() {
        return degreeCredits;
    }

    public void setDegreeCredits(int degreeCredits) {
        this.degreeCredits = degreeCredits;
    }
}
