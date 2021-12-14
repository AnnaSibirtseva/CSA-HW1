#include <string>
#include <iostream>
#include <thread>

struct Book {
    int row_{};
    int bookcase_{};
    int id_{};

    Book(int row, int bookcase, int id) : row_(row), bookcase_(bookcase), id_(id) {
    }

    Book() = default;

    void printMove(int row, int bookcase, std::thread::id id) const {
        std::cout << "Book [" << id_ << "]: " + std::to_string(row_) +
            " row " + std::to_string(bookcase_) + " bookcase -----> " + std::to_string(row) +
            " row " + std::to_string(bookcase) + " bookcase " +
            "(by student with ID " << std::this_thread::get_id() << ")\n";
    }

    void printBook() const {
        std::cout << "Book [" << id_ << "]: " + std::to_string(row_) +
            " row " + std::to_string(bookcase_) + " bookcase\n";
    }
};