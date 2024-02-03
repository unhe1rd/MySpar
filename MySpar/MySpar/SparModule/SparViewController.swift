//
//  SparViewController.swift
//  MySpar
//
//  Created by Mike Ulanov on 02.02.2024.
//

import Foundation
import UIKit

final class SparViewController: UIViewController, UITabBarDelegate {
    
    let output: SparViewOutput
    var model: SparViewModel?
    let scrollView = UIScrollView()
    let containerView = UIView()
    let productImage = UIImageView()
    let starImage = UIImageView()
    let tagImage = UIImageView()
    let countryImage = UIImageView()
    let discountButton = UIButton()
    let ratingLabel = UILabel()
    let productTextLabel = UILabel()
    let countryLabel = UILabel()
    let mainDescriptionLabel = UILabel()
    let descriptionLabel = UILabel()
    let mainSpecificationsLabel = UILabel()
    let mainProdusedByLabel = UILabel()
    let mainEnergyLabel = UILabel()
    let mainFatsLabel = UILabel()
    let mainProteinsLabel = UILabel()
    let mainCarbLabel = UILabel()
    let produsedByLabel = UILabel()
    let energyLabel = UILabel()
    let fatsLabel = UILabel()
    let proteinsLabel = UILabel()
    let carbLabel = UILabel()
    let allSpecificationsLabel = UILabel()
    let mainReviewsLabel = UILabel()
    let reviewsCountLabel = UILabel()
    let reviewButton = UIButton()
    
    let buyButton = UIButton()
    let cartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didLoadView()
        scrollView.delegate = self
        view.backgroundColor = UIColor.white
        
        setupScrollView()
        setupContainerView()
        setupProductImage()
        setupDiscountButton()
        setupStarImage()
        setupTagImage()
        setupRatingLabel()
        setupProductTextLabel()
        setupCountryImage()
        setupCountryLabel()
        setupMainDescriptionLabel()
        setupDescriptionLabel()
        setupMainSpecificationsLabel()
        setupMainProdusedByLabel()
        setupMainEnergyLabel()
        setupMainFatsLabel()
        setupMainProteinsLabel()
        setupMainCarbLabel()
        setupProdusedByLabel()
        setupEnergyLabel()
        setupFatsLabel()
        setupProteinsLabel()
        setupCarbLabel()
        setupAllSpecificationsLabel()
        setupMainReviewsLabel()
        setupReviewsCountLabel()
        
        setupReviewButton()
        setupBuyButton()
        setupCartButton()
        
        setupNavigationBar()
        
    }
    
    init(output: SparViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("[DEBUG]: FATAL ERROR")
    }
    
    func setupNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = Constants.baseColor
        self.navigationItem.leftBarButtonItem = backButton
        
        let rightButton1 = UIBarButtonItem(image: UIImage(systemName: "book.pages"), style: .plain, target: self, action: #selector(backButtonTapped))
        rightButton1.tintColor = Constants.baseColor
        self.navigationItem.rightBarButtonItem = rightButton1
        
        let rightButton2 = UIBarButtonItem(image: UIImage(systemName: "tray.and.arrow.up"), style: .plain, target: self, action: #selector(backButtonTapped))
        rightButton2.tintColor = Constants.baseColor
        self.navigationItem.rightBarButtonItem = rightButton2
        
        let rightButton3 = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(backButtonTapped))
        rightButton3.tintColor = Constants.baseColor
        self.navigationItem.rightBarButtonItems = [rightButton3, rightButton2, rightButton1]
    }
    
    @objc private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SparViewController{
    
    func setupScrollView() {
            view.addSubview(scrollView)
            scrollView.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
            scrollView.showsVerticalScrollIndicator = false // Для вертикальной полоски прокрутки
            
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
        }

    func setupContainerView() {
            scrollView.addSubview(containerView)
            containerView.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
            
            NSLayoutConstraint.activate([
                containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
                containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
                containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
                containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            ])
        }
    
    
    func setupProductImage() {
        containerView.addSubview(productImage)
        productImage.translatesAutoresizingMaskIntoConstraints = false
        let imageHeight: CGFloat = UIScreen.main.bounds.height / 2.5
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            productImage.heightAnchor.constraint(equalToConstant: imageHeight),
            productImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    func setupDiscountButton() {
        containerView.addSubview(discountButton)
        discountButton.translatesAutoresizingMaskIntoConstraints = false
        discountButton.layer.masksToBounds = true
        discountButton.layer.cornerRadius = 3
        discountButton.setTitle("Цена по карте", for: .normal)
        discountButton.backgroundColor = Constants.baseColor
        discountButton.titleColor(for: .normal)
        
        NSLayoutConstraint.activate([
            discountButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            discountButton.heightAnchor.constraint(equalToConstant: 25),
            discountButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            discountButton.trailingAnchor.constraint(equalTo: discountButton.leadingAnchor, constant: 130 )
        ])
            
    }
    
    func setupStarImage(){
        containerView.addSubview(starImage)
        starImage.image = UIImage(systemName: "star.fill")
        starImage.tintColor = .systemYellow
        starImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.contentMode = .scaleAspectFit
        starImage.clipsToBounds = false
        
        NSLayoutConstraint.activate([
            starImage.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: -16),
            starImage.heightAnchor.constraint(equalToConstant: 32),
            starImage.widthAnchor.constraint(equalToConstant: 32),
            starImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24)
        ])
    }
    
    func setupTagImage() {
        containerView.addSubview(tagImage)
        tagImage.image = UIImage(named: "discountImage")
        tagImage.tintColor = .systemRed
        tagImage.translatesAutoresizingMaskIntoConstraints = false
        tagImage.contentMode = .scaleAspectFit
        tagImage.clipsToBounds = false
        
        NSLayoutConstraint.activate([
            tagImage.centerYAnchor.constraint(equalTo: starImage.centerYAnchor, constant: -4),
            tagImage.heightAnchor.constraint(equalToConstant: 64),
            tagImage.widthAnchor.constraint(equalToConstant: 64),
            tagImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])
    }
    
    func setupRatingLabel(){
        containerView.addSubview(ratingLabel)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: starImage.topAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: 32),
            ratingLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 0)
        ])
    }
    
    func setupProductTextLabel(){
        containerView.addSubview(productTextLabel)
        productTextLabel.translatesAutoresizingMaskIntoConstraints = false
        productTextLabel.font = UIFont.boldSystemFont(ofSize: 28)
        productTextLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            productTextLabel.topAnchor.constraint(equalTo: starImage.bottomAnchor, constant: 24),
            productTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            productTextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupCountryImage(){
        containerView.addSubview(countryImage)
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.contentMode = .scaleAspectFit
        countryImage.clipsToBounds = false
        
        NSLayoutConstraint.activate([
            countryImage.topAnchor.constraint(equalTo: productTextLabel.bottomAnchor, constant: 24),
            countryImage.heightAnchor.constraint(equalToConstant: 32),
            countryImage.widthAnchor.constraint(equalToConstant: 32),
            countryImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24)
        ])
    }
    
    func setupCountryLabel(){
        containerView.addSubview(countryLabel)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: countryImage.topAnchor, constant: 0),
            countryLabel.heightAnchor.constraint(equalToConstant: 32),
            countryLabel.leadingAnchor.constraint(equalTo: countryImage.trailingAnchor, constant: 8)
        ])
    }
    
    func setupMainDescriptionLabel(){
        containerView.addSubview(mainDescriptionLabel)
        mainDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        mainDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        mainDescriptionLabel.text = "Описание"
        mainDescriptionLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            mainDescriptionLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 24),
            mainDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupDescriptionLabel(){
        containerView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: mainDescriptionLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])

    }
    
    func setupMainSpecificationsLabel(){
        containerView.addSubview(mainSpecificationsLabel)
        mainSpecificationsLabel.translatesAutoresizingMaskIntoConstraints = false
        mainSpecificationsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        mainSpecificationsLabel.text = "Основные характеристики"
        mainSpecificationsLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            mainSpecificationsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            mainSpecificationsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainSpecificationsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupMainProdusedByLabel() {
        containerView.addSubview(mainProdusedByLabel)
        mainProdusedByLabel.translatesAutoresizingMaskIntoConstraints = false
        mainProdusedByLabel.font = UIFont.systemFont(ofSize: 16)
        mainProdusedByLabel.text = "Производство"
        NSLayoutConstraint.activate([
            mainProdusedByLabel.topAnchor.constraint(equalTo: mainSpecificationsLabel.bottomAnchor, constant: 16),
            mainProdusedByLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainProdusedByLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupMainEnergyLabel() {
        containerView.addSubview(mainEnergyLabel)
        mainEnergyLabel.translatesAutoresizingMaskIntoConstraints = false
        mainEnergyLabel.font = UIFont.systemFont(ofSize: 16)
        mainEnergyLabel.text = "Энергетическая ценность, ккал/100г"
        mainEnergyLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            mainEnergyLabel.topAnchor.constraint(equalTo: mainProdusedByLabel.bottomAnchor, constant: 16),
            mainEnergyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainEnergyLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -16)
        ])
    }
    
    func setupMainFatsLabel() {
        containerView.addSubview(mainFatsLabel)
        mainFatsLabel.translatesAutoresizingMaskIntoConstraints = false
        mainFatsLabel.font = UIFont.systemFont(ofSize: 16)
        mainFatsLabel.text = "Жиры/100г"
        mainFatsLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            mainFatsLabel.topAnchor.constraint(equalTo: mainEnergyLabel.bottomAnchor, constant: 16),
            mainFatsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainFatsLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -16)
        ])
    }
    
    func setupMainProteinsLabel() {
        containerView.addSubview(mainProteinsLabel)
        mainProteinsLabel.translatesAutoresizingMaskIntoConstraints = false
        mainProteinsLabel.font = UIFont.systemFont(ofSize: 16)
        mainProteinsLabel.text = "Белки/100г"
        mainProteinsLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            mainProteinsLabel.topAnchor.constraint(equalTo: mainFatsLabel.bottomAnchor, constant: 16),
            mainProteinsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainProteinsLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -16)
        ])
    }
    
    func setupMainCarbLabel() {
        containerView.addSubview(mainCarbLabel)
        mainCarbLabel.translatesAutoresizingMaskIntoConstraints = false
        mainCarbLabel.font = UIFont.systemFont(ofSize: 16)
        mainCarbLabel.text = "Углеводы/100г"
        mainCarbLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            mainCarbLabel.topAnchor.constraint(equalTo: mainProteinsLabel.bottomAnchor, constant: 16),
            mainCarbLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainCarbLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -16)
        ])
    }
    
    func setupProdusedByLabel() {
        containerView.addSubview(produsedByLabel)
        produsedByLabel.translatesAutoresizingMaskIntoConstraints = false
        produsedByLabel.font = UIFont.systemFont(ofSize: 16)
        produsedByLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            produsedByLabel.topAnchor.constraint(equalTo: mainSpecificationsLabel.bottomAnchor, constant: 16),
            produsedByLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 16),
            produsedByLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupEnergyLabel() {
        containerView.addSubview(energyLabel)
        energyLabel.translatesAutoresizingMaskIntoConstraints = false
        energyLabel.font = UIFont.systemFont(ofSize: 16)
        produsedByLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            energyLabel.centerYAnchor.constraint(equalTo: mainEnergyLabel.centerYAnchor),
            energyLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 16),
            energyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupFatsLabel() {
        containerView.addSubview(fatsLabel)
        fatsLabel.translatesAutoresizingMaskIntoConstraints = false
        fatsLabel.font = UIFont.systemFont(ofSize: 16)
        fatsLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            fatsLabel.topAnchor.constraint(equalTo: mainEnergyLabel.bottomAnchor, constant: 16),
            fatsLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 16),
            fatsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupProteinsLabel() {
        containerView.addSubview(proteinsLabel)
        proteinsLabel.translatesAutoresizingMaskIntoConstraints = false
        proteinsLabel.font = UIFont.systemFont(ofSize: 16)
        proteinsLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            proteinsLabel.topAnchor.constraint(equalTo: mainFatsLabel.bottomAnchor, constant: 16),
            proteinsLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 16),
            proteinsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupCarbLabel() {
        containerView.addSubview(carbLabel)
        carbLabel.translatesAutoresizingMaskIntoConstraints = false
        carbLabel.font = UIFont.systemFont(ofSize: 16)
        carbLabel.numberOfLines = 0
        NSLayoutConstraint.activate([
            carbLabel.topAnchor.constraint(equalTo: mainProteinsLabel.bottomAnchor, constant: 16),
            carbLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 16),
            carbLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupAllSpecificationsLabel() {
        containerView.addSubview(allSpecificationsLabel)
        allSpecificationsLabel.translatesAutoresizingMaskIntoConstraints = false
        allSpecificationsLabel.font = UIFont.boldSystemFont(ofSize: 16)
        allSpecificationsLabel.text = "Все характеристики"
        allSpecificationsLabel.numberOfLines = 0
        allSpecificationsLabel.textColor = Constants.baseColor
        
        NSLayoutConstraint.activate([
            allSpecificationsLabel.topAnchor.constraint(equalTo: carbLabel.bottomAnchor, constant: 24),
            allSpecificationsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            allSpecificationsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
            
        ])
    }
    
    func setupMainReviewsLabel() {
        containerView.addSubview(mainReviewsLabel)
        mainReviewsLabel.translatesAutoresizingMaskIntoConstraints = false
        mainReviewsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        mainReviewsLabel.numberOfLines = 0
        mainReviewsLabel.text = "Отзывы"
        NSLayoutConstraint.activate([
            mainReviewsLabel.topAnchor.constraint(equalTo: allSpecificationsLabel.bottomAnchor, constant: 24),
            mainReviewsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainReviewsLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    func setupReviewsCountLabel() {
        containerView.addSubview(reviewsCountLabel)
        reviewsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewsCountLabel.font = UIFont.boldSystemFont(ofSize: 16)
        reviewsCountLabel.numberOfLines = 0
        reviewsCountLabel.textColor = Constants.baseColor
        
        NSLayoutConstraint.activate([
            reviewsCountLabel.topAnchor.constraint(equalTo: allSpecificationsLabel.bottomAnchor, constant: 24),
            reviewsCountLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    func setupReviewButton() {
        containerView.addSubview(reviewButton)
        reviewButton.translatesAutoresizingMaskIntoConstraints = false
        reviewButton.layer.masksToBounds = true
        reviewButton.layer.cornerRadius = 16
        reviewButton.setTitle("Оставить отзыв", for: .normal)
        reviewButton.setTitleColor(Constants.baseColor, for: .normal) // Цвет текста
        reviewButton.backgroundColor = UIColor.white // Цвет фона
        reviewButton.layer.borderColor = Constants.baseColor.cgColor // Цвет границы
        reviewButton.layer.borderWidth = 2 // Толщина границы
        reviewButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        NSLayoutConstraint.activate([
            reviewButton.topAnchor.constraint(equalTo: reviewsCountLabel.topAnchor, constant: 24),
            reviewButton.heightAnchor.constraint(equalToConstant: 32),
            reviewButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            reviewButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            reviewButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -200)
        ])
    }
    
    func setupBuyButton() {
        view.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.layer.masksToBounds = true
        buyButton.layer.cornerRadius = 20
        buyButton.setTitle("Купить сейчас", for: .normal)
        buyButton.backgroundColor = Constants.baseColor // Цвет фона
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            buyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            buyButton.heightAnchor.constraint(equalToConstant: 40),
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8),
        ])
    }
    
    func setupCartButton() {
        view.addSubview(cartButton)
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.layer.masksToBounds = true
        cartButton.layer.cornerRadius = 20
        cartButton.setTitle("В корзину", for: .normal)
        cartButton.setTitleColor(Constants.baseColor, for: .normal) // Цвет текста
        cartButton.backgroundColor = UIColor.white // Цвет фона
        cartButton.layer.borderColor = Constants.baseColor.cgColor // Цвет границы
        cartButton.layer.borderWidth = 2 // Толщина границы
        cartButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            cartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            cartButton.heightAnchor.constraint(equalToConstant: 40),
            cartButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            cartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
}

extension SparViewController: SparViewInput{
    func configure(with model: SparViewModel) {
        // mockData
        productImage.image = model.productImage
        ratingLabel.text = model.ratingLabel
        productTextLabel.text = model.productTextLabel
        countryImage.image = model.countryImage
        countryLabel.text = model.countryLabel
        descriptionLabel.text = model.descriptionLabel
        produsedByLabel.text = model.produsedByLabel
        energyLabel.text = model.energyValueLabel
        fatsLabel.text = model.fatsLabel
        proteinsLabel.text = model.proteinsLabel
        carbLabel.text = model.carbLabel
        reviewsCountLabel.text = model.reviewsCount
    }
}

extension SparViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}

extension SparViewController: UIScrollViewDelegate {
    
}
