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
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didLoadView()
        scrollView.delegate = self
        view.backgroundColor = UIColor.white
        
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withTintColor(.systemGreen), style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
        
        setupScrollView()
        setupContainerView()
        setupProductImage()
        
    }
    
    init(output: SparViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("[DEBUG]: FATAL ERROR")
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
        productImage.translatesAutoresizingMaskIntoConstraints = false //включаем верстку кодом
        productImage.contentMode = .scaleAspectFit
        productImage.clipsToBounds = false
        
        let filmHeight: CGFloat = UIScreen.main.bounds.height / 2.5
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            productImage.heightAnchor.constraint(equalToConstant: filmHeight),
            productImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    

    
}

extension SparViewController: SparViewInput{
    func configure(with model: SparViewModel) {
        // mockData
        productImage.image = model.productImage
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
