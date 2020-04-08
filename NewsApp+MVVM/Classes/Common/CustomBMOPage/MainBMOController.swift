//
//  MainBMOController.swift
//  NewsApp+MVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import BmoViewPager

class MainBMOController: UIViewController {
    
    // MARK: - Properties
    
    lazy var bmoPager: BmoViewPager = {
        let bmo = BmoViewPager()
        bmo.delegate = self
        bmo.dataSource = self
        bmo.scrollable = true
        return bmo
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutUI()
        configureBmoPager()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        view.addSubview(bmoPager)
        
        bmoPager.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    private func configureBmoPager() {
        let navigationBar = BmoViewPagerNavigationBar(frame: CGRect(origin: .zero, size: .init(width: view.frame.width, height: 30)))
        self.navigationItem.titleView = navigationBar
        navigationBar.backgroundColor = .clear
        navigationBar.viewPager = bmoPager
    }

}

// MARK: - BmoViewPagerDataSource, BmoViewPagerDelegate

extension MainBMOController: BmoViewPagerDataSource, BmoViewPagerDelegate {
    
    func bmoViewPagerDataSourceNaviagtionBarItemNormalAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.strokeWidth     : 1.0,
            NSAttributedString.Key.strokeColor     : UIColor.black,
            NSAttributedString.Key.foregroundColor : UIColor.groupTableViewBackground
        ]
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemHighlightedAttributed(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> [NSAttributedString.Key : Any]? {
        return [
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemSize(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> CGSize {
        CGSize(width: navigationBar.bounds.width / 4, height: navigationBar.bounds.height)
    }
    
    func bmoViewPagerDataSourceNaviagtionBarItemTitle(_ viewPager: BmoViewPager, navigationBar: BmoViewPagerNavigationBar, forPageListAt page: Int) -> String? {
        switch page {
        case 0:
            return "General"
        case 1:
            return "Entertainment"
        case 2:
            return "Sports"
        case 3:
            return "Technology"
        default:
            break
        }
        return ""
    }
    
    func bmoViewPagerDataSourceNumberOfPage(in viewPager: BmoViewPager) -> Int {
        return 4
    }
    
    func bmoViewPagerDataSource(_ viewPager: BmoViewPager, viewControllerForPageAt page: Int) -> UIViewController {
        switch page {
        case 0: return TopHeadlineController()
        case 1: return EntertainmentController()
        case 2: return SportsController()
        case 3: return TechnologyController()
        default:
            break
        }
        return UIViewController()
    }
}
