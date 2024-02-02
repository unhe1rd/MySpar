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
    let productionCountryLabel: String
    let energyValueLabel: String
    let fatsLabel: String
    let proteinsLabel: String
    let carbLabel: String
    
    var productImage = UIImage()
    var countryImage = UIImage()
    
    init(productImage: UIImage,countryImage: UIImage, countryLabel: String, descriptionLabel: String, productionCountryLabel: String, energyValueLabel: String,fatsLabel: String,proteinsLabel: String,carbLabel: String, productTextLabel: String) {
        self.productImage = productImage
        self.countryImage = countryImage
        self.countryLabel = countryLabel
        self.descriptionLabel = descriptionLabel
        self.productionCountryLabel = productionCountryLabel
        self.energyValueLabel = energyValueLabel
        self.fatsLabel = fatsLabel
        self.proteinsLabel = proteinsLabel
        self.carbLabel = carbLabel
        self.productTextLabel = productTextLabel
    }
    
}
