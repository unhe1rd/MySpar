//
//  SparPresenter.swift
//  MySpar
//
//  Created by Mike Ulanov on 02.02.2024.
//

import Foundation
import UIKit

final class SparPresenter {
    weak var view : SparViewInput?
    weak var moduleOutput: SparModuleOutput?
}

extension SparPresenter: SparModuleOutput{}

extension SparPresenter: SparViewOutput{
    
    func didLoadView() {
        mockData()
    }
}



private extension SparPresenter {
    func mockData() {
        let productImage = UIImage(named: "productImage") ?? UIImage(named: "defaultImage")!
        let countryImage = UIImage(named: "countryImage") ?? UIImage(named: "defaultImage")!
        
        let data: SparViewModel = .init(
            productImage: productImage,
            countryImage: countryImage,
            countryLabel: "Северная Индия, Ассам",
            descriptionLabel: "Изысканная смесь самого высококачественного ассамского чая, выращенного на знаменитых плантациях, обеспечивает непревзойденный аромат и богатый вкус. Этот чай пробуждает чувства и окутывает утонченным послевкусием, призванным удовлетворить самых взыскательных ценителей чая. Наслаждайтесь этим непревзойденным чаем в уединении или в компании близких, и каждая чашка станет незабываемым ритуалом в вашей жизни.",
            energyValueLabel: "25 ккал, 105 кДж",
            fatsLabel: "0,1 г",
            proteinsLabel: "1,5 г",
            carbLabel: "3,2 г",
            productTextLabel: "Чай Чёрный Golden Tips Assam 100г", 
            ratingLabel: "4.1 | 19 отзывов",
            produsedByLabel: "Россия, Москва",
            reviewsCount: "Всe 228")
        
        view?.configure(with: data)
    }
        
}
