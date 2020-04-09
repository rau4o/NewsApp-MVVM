//
//  TopHeadlineController.swift
//  NewsAppMVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import SDWebImage

private let topHeadlineCell = "cellId"
private let rowHeight: CGFloat = 170
private let spacingBetweenRow: CGFloat = 20

class TopHeadlineController: UIViewController {

    // MARK: - Properties
    
    let topHeadlineViewModel = TopHeadlineViewModel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 10, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.register(TopHeadlinesViewCell.self, forCellWithReuseIdentifier: topHeadlineCell)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Headlines"
        layoutUI()
        topHeadlineViewModel.delegate = self
        topHeadlineViewModel.fetchData(country: "us", category: "general")
        view.backgroundColor = .white
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        view.addSubview(collectionView)
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension TopHeadlineController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topHeadlineViewModel.numberOfElements()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: topHeadlineCell, for: indexPath) as! TopHeadlinesViewCell
        cell.backgroundColor = .clear
        let news = topHeadlineViewModel.getElement(at: indexPath.item)
        cell.configureCell(articles: news)
        if let imageUrl = news.urlImage {
            cell.imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder"))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: rowHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingBetweenRow
    }
}

// MARK: - TopHeadlineViewModelDelegate, TopHeadlineControllerDelegate

extension TopHeadlineController: TopHeadlineViewModelDelegate {
    func updateViewModelData() {
        collectionView.reloadData()
    }
}

extension TopHeadlineController: TopHeadlineControllerDelegate {
    func updateData() {
        topHeadlineViewModel.fetchData(country: "us", category: "general")
    }
}
