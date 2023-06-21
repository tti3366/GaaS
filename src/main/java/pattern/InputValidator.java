package pattern;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class InputValidator {
    private static final String STUDENT_ID_PATTERN = "\\d{8}"; // 8자리 숫자
    private static final String PHONE_NUMBER_PATTERN = "\\d{11}"; // 11자리 숫자

    public static boolean validateStudentId(String input) {
        Pattern pattern = Pattern.compile(STUDENT_ID_PATTERN);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }

    public static boolean validatePhoneNumber(String input) {
        Pattern pattern = Pattern.compile(PHONE_NUMBER_PATTERN);
        Matcher matcher = pattern.matcher(input);
        return matcher.matches();
    }
}
