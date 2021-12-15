#include <string>
#include <iostream>
#include <thread>

struct Book {
    int row_{};
    int bookcase_{};
    int id_{};

    /**
     * A constructor with the necessary parameters for creating a book.
     * @param row Book row.
     * @param bookcase Book bookcase.
     * @param id Book id.
     */
    Book(int row, int bookcase, int id) : row_(row), bookcase_(bookcase), id_(id) {
    }

    /**
     * The default constructor for the book, so that you can create a list and stack.
     */
    Book() = default;

    /**
     * Output to the book movement console.
     * @param row Olb book row (incorrect).
     * @param bookcase Olb bookcase row (incorrect).
     * @param id Book id.
     */
    void printMove(int row, int bookcase, std::thread::id id) const {
        std::cout << "Book [" << id_ << "]: " + std::to_string(row_) +
            " row " + std::to_string(bookcase_) + " bookcase -----> " + std::to_string(row) +
            " row " + std::to_string(bookcase) + " bookcase " +
            "(by student with ID " << std::this_thread::get_id() << ")\n";
    }

    /**
     * Displaying the location of the book in the catalog.
     */
    void printBook() const {
        std::cout << "Book [" << id_ << "]: " + std::to_string(row_) +
            " row " + std::to_string(bookcase_) + " bookcase\n";
    }
};
