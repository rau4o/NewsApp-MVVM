//
//  EverythingController.swift
//  NewsApp+MVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

private let everythingCellId = "cellid"
private let rowHeight: CGFloat = 170
private let spacingBetweenRow: CGFloat = 20

class EverythingController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel = TopHeadlineViewModel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TopHeadlinesViewCell.self, forCellWithReuseIdentifier: everythingCellId)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Everything"
        layoutUI()
        viewModel.delegate = self
        viewModel.fetchEverythingData()
        view.backgroundColor = .white
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        view.addSubview(collectionView)
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
}

// MARK: - UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout

extension EverythingController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfElements()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: everythingCellId, for: indexPath) as! TopHeadlinesViewCell
        cell.backgroundColor = .clear
        let news = viewModel.getElement(at: indexPath.item)
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

extension EverythingController: TopHeadlineViewModelDelegate {
    func updateViewModelData() {
        collectionView.reloadData()
    }
}

extension EverythingController: TopHeadlineControllerDelegate {
    func updateData() {
        viewModel.fetchEverythingData()
    }
}

