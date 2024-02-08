//
//  ReviewCellModel.swift
//  MySpar
//
//  Created by Mike Ulanov on 08.02.2024.
//

import Foundation
import UIKit

struct ReviewCellModel {
    
    let authorName: String
    let date: String
    let reviewText: String
    let starsCount: Int
    
    init(authorName: String, date: String, reviewText: String, starsCount: Int) {
        self.authorName = authorName
        self.date = date
        self.reviewText = reviewText
        self.starsCount = starsCount
    }
}
