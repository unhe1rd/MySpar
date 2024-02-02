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
    let countryImage = UIImageView()
    let discountButton = UIButton()
    let ratingLabel = UILabel()
    let productTextLabel = UILabel()
    let countryLabel = UILabel()
    let mainDescriptionLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didLoadView()
        scrollView.delegate = self
        view.backgroundColor = UIColor.white
        
        setupScrollView()
        setupContainerView()
        setupProductImage()
        setupDiscountLabel()
        setupStarImage()
        setupRatingLabel()
        setupProductTextLabel()
        setupCountryImage()
        setupCountryLabel()
        setupMainDescriptionLabel()
        setupDescriptionLabel()
        
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
                containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
                containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
                containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            ])
        }
    
    
    func setupProductImage() {
        containerView.addSubview(productImage)
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds = false
        
        let height: CGFloat = UIScreen.main.bounds.height / 2.5
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            productImage.heightAnchor.constraint(equalToConstant: height),
            productImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    func setupDiscountLabel() {
        containerView.addSubview(discountButton)
        discountButton.translatesAutoresizingMaskIntoConstraints = false
        discountButton.layer.masksToBounds = true
        discountButton.layer.cornerRadius = 3
        discountButton.setTitle("Цена по карте", for: .normal)
        discountButton.backgroundColor = Constants.baseColor
        discountButton.titleColor(for: .normal)
        
        NSLayoutConstraint.activate([
            discountButton.topAnchor.constraint(equalTo: productImage.topAnchor, constant: 10),
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
            mainDescriptionLabel.topAnchor.constraint(equalTo: countryImage.bottomAnchor, constant: 24),
            mainDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    func setupDescriptionLabel(){
        containerView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: mainDescriptionLabel.bottomAnchor, constant: 0),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
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
