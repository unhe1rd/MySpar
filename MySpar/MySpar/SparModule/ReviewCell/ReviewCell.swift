//
//  ReviewCell.swift
//  MySpar
//
//  Created by Mike Ulanov on 08.02.2024.
//

import Foundation
import UIKit

final class ReviewCell: UICollectionViewCell {
    
    let authorNameLabel = UILabel()
    let dateLabel = UILabel()
    let reviewTextLabel = UILabel()
//    let stars = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ReviewCellModel) {
        authorNameLabel.text = model.authorName
        dateLabel.text = model.date
        reviewTextLabel.text = model.reviewText
    }
}

private extension ReviewCell {
    func setup() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [Constants.baseColor.cgColor, Constants.reviewBackgroundColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.cornerRadius = 20
        layer.addSublayer(gradientLayer)
        setupAuthorNameLabel()
        setupDateLabel()
        setupReviewTextLabel()
        layer.cornerRadius = 20
        layer.borderWidth = 3
        layer.borderColor = Constants.baseColor.cgColor
    }
    
    func setupAuthorNameLabel() {
        addSubview(authorNameLabel)
        authorNameLabel.numberOfLines = 0
        authorNameLabel.lineBreakMode = .byWordWrapping
        authorNameLabel.textAlignment = .left
        authorNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            authorNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
    
    func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.numberOfLines = 0
        dateLabel.lineBreakMode = .byWordWrapping
        dateLabel.textAlignment = .left
        dateLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dateLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    func setupReviewTextLabel() {
        addSubview(reviewTextLabel)
        reviewTextLabel.numberOfLines = 0
        reviewTextLabel.lineBreakMode = .byWordWrapping
        reviewTextLabel.textAlignment = .left
        reviewTextLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        reviewTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            reviewTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            reviewTextLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            reviewTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }
}
