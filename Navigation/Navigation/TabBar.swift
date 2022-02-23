//
//  TabBar.swift
//  Navigation
//
//  Created by Алексей Заметаев on 08.02.2022.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupViewControllers()
        
    }
    
    func setupViewControllers() {
        viewControllers = [
            createNavController(for: FeedViewController(), title: NSLocalizedString("Feed", comment: ""), image: UIImage(systemName: "house.fill")!),
            createNavController(for: LogInViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person.fill")!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = false
        rootViewController.navigationItem.title = title

        return navController
        
    }
}
