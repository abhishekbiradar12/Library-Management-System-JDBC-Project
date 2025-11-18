package com.library;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        LibraryDAO dao = new LibraryDAO();
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("\n=== LIBRARY MANAGEMENT SYSTEM ===");
            System.out.println("1. Add Book");
            System.out.println("2. View All Books");
            System.out.println("3. Search Book by ID");
            System.out.println("4. Delete Book");
            System.out.println("5. Exit");
            System.out.print("Enter choice: ");
            int choice = sc.nextInt();
            sc.nextLine(); // consume newline

            switch (choice) {
                case 1 -> {
                    System.out.print("Enter title: ");
                    String title = sc.nextLine();
                    System.out.print("Enter author: ");
                    String author = sc.nextLine();
                    System.out.print("Enter price: ");
                    double price = sc.nextDouble();
                    dao.addBook(title, author, price);
                }
                case 2 -> dao.viewBooks();
                case 3 -> {
                    System.out.print("Enter book ID: ");
                    int id = sc.nextInt();
                    dao.searchBook(id);
                }
                case 4 -> {
                    System.out.print("Enter book ID to delete: ");
                    int id = sc.nextInt();
                    dao.deleteBook(id);
                }
                case 5 -> {
                    System.out.println("Exiting...");
                    sc.close();
                    return;
                }
                default -> System.out.println("Invalid choice!");
            }
        }
    }
}
