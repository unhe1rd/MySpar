//
//  TabBarController.swift
//  MySpar
//
//  Created by Mike Ulanov on 02.02.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupTabs()
    
    }
}

private extension TabBarController {
    
    func generateVC(viewController: UIViewController, title: String) -> UIViewController {
        viewController.tabBarItem.title = title
        
        return viewController
    }
    
    func setupTabBar() {
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemGreen
    }
    
    
    func setupTabs() {

        let sparVC = UINavigationController(rootViewController: SparAssembly.assembly())
        sparVC.tabBarItem.title = "Поиск"
        sparVC.tabBarItem.image = UIImage(systemName: "arrow.up.heart.fill")
        sparVC.tabBarItem.tag = 1
        
        let catalogVC = UIViewController()
        catalogVC.tabBarItem.title = "Каталог"
        catalogVC.tabBarItem.image = UIImage(systemName: "chart.bar.doc.horizontal")
        catalogVC.tabBarItem.tag = 2
        
        let cartVC = UIViewController()
        cartVC.tabBarItem.title = "Корзина"
        cartVC.tabBarItem.image = UIImage(systemName: "cart")
        cartVC.tabBarItem.tag = 3
        
        let profileVC = UIViewController()
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.tabBarItem.tag = 4
        
        viewControllers = [sparVC, catalogVC, cartVC, profileVC]
    }
    
}

