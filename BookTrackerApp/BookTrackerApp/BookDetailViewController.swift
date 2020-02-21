//
//  BookDetailViewController.swift
//  BookTrackerApp
//
//  Created by A&A on 2020-02-18.
//  Copyright © 2020 Albert Kozak. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var isbnLabel: UILabel!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var notesLabel: UILabel!
  
  var book: Book?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let definedBook = book,
      let url = URL(string : definedBook.coverImageURL),
      let data = try? Data(contentsOf: url)
    {
      self.imageView.image = UIImage(data: data)
      self.titleLabel.text = book?.title
      self.authorLabel.text = book?.author
      self.isbnLabel.text = book?.isbn
      self.ratingLabel.text = String(book!.rating)
      self.notesLabel.text = book?.notes
    }
  }
}
