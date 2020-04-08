//
//  MainTabBar.swift
//  NewsAppMVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    // MARK: - Helper function
    
    private func setupControllers() {
        let topHeadlineController = UINavigationController(rootViewController: TopHeadlineController())
        topHeadlineController.tabBarItem = UITabBarItem(title: "Top Headline", image: #imageLiteral(resourceName: "home"), tag: 0)
        
        viewControllers = [topHeadlineController]
    }
}
