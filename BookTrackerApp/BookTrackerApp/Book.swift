//
//  Book.swift
//  BookTrackerApp
//
//  Created by A&A on 2020-02-18.
//  Copyright © 2020 Albert Kozak. All rights reserved.
//

import Foundation

class Book {
  var title: String
  var isbn: String
  var author: String
  var coverImageURL: String
  var rating: Int
  var notes: String?
  
  init(title: String, isbn: String,author: String, coverImageURL: String, rating: Int, notes: String? ) {
    self.title = title
    self.isbn = isbn
    self.author = author
    self.coverImageURL = coverImageURL
    self.rating = rating
    if let realNotes = notes {
      self.notes = realNotes
    }
  }
}
