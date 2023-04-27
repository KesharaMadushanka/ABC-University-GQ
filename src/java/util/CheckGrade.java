package util;

import java.util.Objects;

public class CheckGrade {
    public static boolean savedGrade (String grade,String Value){
        if(Objects.equals(grade, "")) {
            return false;
        } else return grade.equals(Value);

    }

    public static boolean disabledGrade (String grade){
        return !Objects.equals(grade, "");
    }
}
