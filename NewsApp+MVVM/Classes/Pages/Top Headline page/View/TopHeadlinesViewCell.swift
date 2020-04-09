//
//  TopHeadlinesViewCell.swift
//  NewsAppMVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit
import SDWebImage

class TopHeadlinesViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addShadow()
        return view
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .white
        label.numberOfLines = 10
        return label
    }()
    
    var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.backgroundColor = .white
        return image
    }()
    
    private var publishedAtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = .black
        return label
    }()
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    // MARK: - Helper function
    
    private func layoutUI() {
        addSubviews([cardView])
    cardView.addSubviews([imageView,titleLabel,descriptionLabel,authorLabel,publishedAtLabel])
        
        cardView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        imageView.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, width: 150, height: 0)

        titleLabel.anchor(top: imageView.topAnchor, left: imageView.rightAnchor, right: cardView.rightAnchor,paddingTop: 0, paddingLeft: 10, paddingRight: 10,height: 40)
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: imageView.rightAnchor, bottom: imageView.bottomAnchor,right: cardView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0,paddingRight: 10, height: 70)
        
        authorLabel.anchor(top: imageView.bottomAnchor, left: imageView.leftAnchor, right: imageView.rightAnchor, paddingTop: 5, paddingLeft: 0, paddingRight: 0, height: 10)
        
        publishedAtLabel.anchor(top: descriptionLabel.bottomAnchor, right: descriptionLabel.rightAnchor, paddingTop: 5, paddingRight: 0, width: 100, height: 10)
    }
    
    func configureCell(articles: Articles) {
        titleLabel.text = articles.title
        descriptionLabel.text = articles.description
        authorLabel.text = articles.author
        publishedAtLabel.text = articles.publishedAt
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func addSubviews(_ view: [UIView]) {
        for i in view {
            addSubview(i)
        }
    }
}
