#include <algorithm>
#include "Book.cpp"
#include "Checker.cpp"
#include <ctime>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <list>
#include <mutex>
#include <string>
#include <stack>
#include <thread>
#include <utility>
#include <vector>

std::mutex locker;
// Our books catalog.
std::list<Book> catalog;
// Books that need to be sorted and put to catalog.
std::stack<Book> booksToSort;

/**
 * Method for finding correct place for the book in the library.
 * @param book_index Current book index (usually incorrect)/
 * @param booksCounter Sum of all book.
 * @param bookcases Sum of all bookcases.
 * @return Pair - correct row and bookcase fro the book.
 */
std::pair<int, int> findPlace(int book_index, int booksCounter, int bookcases) {
    return std::make_pair(book_index / booksCounter, (book_index % booksCounter) / bookcases);
}

/**
 * Method for thread to take notes about book.
 * @param booksCounter Number of all books.
 * @param booksCount
 */
void takeBook(int booksCounter, int booksCount) {
    while (!booksToSort.empty()) {
        // No one can get here.
        locker.lock();
        Book book = booksToSort.top();
        // Finding correct position.
        std::pair<int, int> position = findPlace(book.id_, booksCounter, booksCount);
        int row = position.first;
        int bookcase = position.second;
        // Deleting book from the unsorted books stack.
        booksToSort.pop();
        // Adding book to catalog.
        catalog.emplace_back(row, bookcase, book.id_);
        // Notifying user.
        book.printMove(row, bookcase, std::this_thread::get_id());
        locker.unlock();
        // Taking notes ia hard, so now we sleep for a couple of seconds.
        std::this_thread::sleep_for(std::chrono::milliseconds(rand() % 420));
    }
}

/**
 * Comparing two books.
 * @param first_book First book to compare.
 * @param second_book Second book to compare.
 * @return
 */
bool compareBooks(Book first_book, Book second_book) {
    return first_book.id_ < second_book.id_;
}

/**
 * Printing info about catalog.
 * @param number_of_rows
 */
void printCatalog(int number_of_rows) {
    // Deleting useless things in the beginning.
    for (int i = 0; i < number_of_rows; ++i) {
        catalog.pop_front();
    }
    std::cout << "\n =====[ CATALOG ]=====\n";
    catalog.sort(compareBooks);
    for (Book book: catalog) {
        book.printBook();
    }
}

/**
 * Randomly feeling library with books.
 * @param rows Number of rows.
 * @param bookcases Number of bookcases.
 * @param books  Number of books.
 * @param all_books Vector of all books to be put in the library.
 * @param library All books container.
 */
void feelLibrary(int rows, int bookcases, int books,
                 std::vector<int64_t> &all_books, Book **library) {
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < bookcases; ++j) {
            for (int t = 0; t < books; ++t) {
                int64_t index = rand() % all_books.size();
                Book *book = new Book(i, j, all_books[index]);
                library[i] = book;
                booksToSort.push(*book);
                all_books.erase(all_books.begin() + index);
            }
        }
    }
}

/**
 * Starting and joining all students.
 * @param students All students, that must be created.
 * @param booksCounter Number of books.
 * @param counter Number of students.
 * @param books Number of books.
 */
void startThreads(std::thread *students, int booksCounter, int counter, int books) {
    for (int i = 0; i < counter; ++i) {
        students[i] = std::thread(takeBook, booksCounter, books);
    }
    for (int i = 0; i < counter; ++i) {
        students[i].join();
    }
}

//------------------------------------------------------------------------------
// --------------------- BEGINNING OF MAIN PROGRAM CODE ------------------------
//------------------------------------------------------------------------------

int main(int argc, char *argv[]) {
    if (argc != 5) {
        Checker::incorrectCommand();
        return 1;
    }
    if (!Checker::inputIsCorrect(argv[1], argv[2], argv[3], argv[4])) {
        return 1;
    }

    int rows = std::stol(argv[1]);
    int bookcases = std::stol(argv[2]);
    int books = std::stol(argv[3]);
    int64_t max_books = rows * bookcases * books;

    std::vector<int64_t> all_books = std::vector<int64_t>();
    for (int64_t i = 0; i < max_books; ++i) {
        all_books.push_back(i);
    }

    int booksCounter = bookcases * books;
    Book **library = new Book *[rows];
    catalog = std::list<Book>(rows);
    feelLibrary(rows, bookcases, books, all_books, library);

    std::cout << "\n =========================[ LIBRARY ]=========================\n";
    int studentsCount = std::stol(argv[4]);
    auto *students = new std::thread[studentsCount];
    startThreads(students, booksCounter, studentsCount, books);
    printCatalog(rows);
    return 0;
}