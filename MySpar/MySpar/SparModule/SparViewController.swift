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
    let containerView = SparAssembly.subassembly()
    let buyButton = UIButton()
    let cartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didLoadView()
        view.backgroundColor = UIColor.white
        
        setupContainerView()
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
    
    
    func setupContainerView() {
        view.addSubview(containerView.view)
        containerView.view.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        
        NSLayoutConstraint.activate([
            containerView.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            containerView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.view.widthAnchor.constraint(equalTo: view.widthAnchor),
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
    func configure(with model: SparViewModel, with review: [ReviewCellModel]) {
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
