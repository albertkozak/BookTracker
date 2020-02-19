//
//  ViewController.swift
//  BookTrackerApp
//
//  Created by A&A on 2020-02-18.
//  Copyright © 2020 Albert Kozak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  // Dummy data
  let books = [
    Book(title: "Harry Potter and the Goblet of Fire", isbn: "1408845679", author: "J.K. Rowling", coverImageURL: "https://images-na.ssl-images-amazon.com/images/I/51BJ2dEdpQL._SX332_BO1,204,203,200_.jpg", rating: 5, notes: ""),
    Book(title: "The Hobbit", isbn: "0261102214", author: "J.R.R. Tolkien", coverImageURL: "https://images-na.ssl-images-amazon.com/images/I/41W5CdiJJ5L._SX306_BO1,204,203,200_.jpg", rating: 5, notes: ""),
    Book(title: "The Fellowship of the Ring", isbn: "9780261102354", author: " J.R.R. Tolkien", coverImageURL: "https://images-na.ssl-images-amazon.com/images/I/311cT2c6%2BUL._SX310_BO1,204,203,200_.jpg", rating: 4, notes: "")
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    // We are telling the tableView that our ViewController will act as its delegate and dataSource
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  // required method to conform to UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // We are setting the number of
    return books.count
  }
  
  // required method to conform to UITableViewDataSource
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // We are getting the cell from the queue of cells
    // We recycle cells for better performance
    let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
    
    let book = Book(title: books[indexPath.row].title, isbn: books[indexPath.row].isbn, author: books[indexPath.row].author, coverImageURL: books[indexPath.row].coverImageURL, rating: books[indexPath.row].rating, notes: books[indexPath.row].notes)
    
    // We set the cell's text label to be our recipe string for that index
    cell.textLabel?.text = books[indexPath.row].title
    
    
    // get image from url
    // note we are retrieving the image synchronously for simplicity, this is not a best practice
    if let url = URL(string: book.coverImageURL), let data = try? Data(contentsOf: url) { //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
      cell.imageView?.image = UIImage(data: data)
    }
    
    return cell
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let bookDetailViewController = segue.destination as? BookDetailViewController,
       let index = tableView.indexPathForSelectedRow?.row {
      bookDetailViewController.book = books[index]
    }
  }
}

