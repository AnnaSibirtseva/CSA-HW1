#include <iostream>
#include <algorithm>
#include <string>

class Checker {
 public:
/**
 * Message if command is incorrect.
 */
    static void incorrectCommand() {
        std::cout << "Incorrect command!\n"
                     "  Waited:\n"
                     "          <number_of_rows> <number_of_bookcases> <number_of_books> <number_of_students>\n";
    }

/**
 * Checking that given string is a number.
 * @param string String to check.
 * @return True if string can be converted to integer and false otherwise.
 */
    static bool is_number(const std::string &string) {
        return !string.empty() && std::all_of(string.begin(), string.end(), ::isdigit);
    }

/**
 * Checking that given number is in the correct bounds.
 * @param number given number.
 * @param max Right bound.
 * @param min Left bound.
 * @param message Error message.
 * @return True if number fitted in the bounds and fa,se otherwise.
 */
    static bool IncorrectNumber(const std::string &number, int max, int min, const std::string &message) {
        if (is_number(number)) {
            if (std::stol(number) < min || std::stol(number) > max) {
                std::cout << message;
                return true;
            }
        }
        return false;
    }

/**
 * Checking that all given params are correct.
 * @param first_param Number of rows.
 * @param second_param Number of bookcases.
 * @param third_param  Number of books.
 * @param fourth_param Number of students.
 * @return
 */
    static bool inputIsCorrect(const std::string &first_param, const std::string &second_param,
                               const std::string &third_param, const std::string &fourth_param) {
        if (IncorrectNumber(first_param, 1000,
                            1, "Number of rows must be integer between 1 and 1000") ||
            IncorrectNumber(second_param, 1000,
                            1, "Number of bookcases must be integer between 1 and 1000") ||
            IncorrectNumber(third_param, 1000,
                            1, "Number of books must be integer between 1 and 1000") ||
            IncorrectNumber(fourth_param, std::stol(first_param),
                            1, "Number of students must be integer between 1 and number of rows")) {
            return false;
        }
        return true;
    }
};

