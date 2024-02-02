//
//  SparViewModel.swift
//  MySpar
//
//  Created by Mike Ulanov on 02.02.2024.
//

import UIKit
import Foundation

struct SparViewModel {

    let productTextLabel: String
    let countryLabel: String
    let descriptionLabel: String
    let energyValueLabel: String
    let fatsLabel: String
    let proteinsLabel: String
    let carbLabel: String
    let ratingLabel: String
    var productImage = UIImage()
    var countryImage = UIImage()
    
    init(productImage: UIImage,countryImage: UIImage, countryLabel: String, descriptionLabel: String, energyValueLabel: String,fatsLabel: String,proteinsLabel: String,carbLabel: String, productTextLabel: String, ratingLabel: String) {
        self.productImage = productImage
        self.countryImage = countryImage
        self.countryLabel = countryLabel
        self.descriptionLabel = descriptionLabel
        self.energyValueLabel = energyValueLabel
        self.fatsLabel = fatsLabel
        self.proteinsLabel = proteinsLabel
        self.carbLabel = carbLabel
        self.productTextLabel = productTextLabel
        self.ratingLabel = ratingLabel
    }
    
}
