//
//  TopHeadlineViewModel.swift
//  NewsAppMVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

class TopHeadlineViewModel {
    
    // MARK: - Properties
    
    var topHeadlineData: [Articles] = []
    weak var delegate: TopHeadlineViewModelDelegate?
    
    // MARK: - Helper function
    
    func numberOfElements() -> Int {
        return topHeadlineData.count
    }
    
    func getElement(at row: Int) -> Articles {
        return topHeadlineData[row]
    }
    
    // MARK: - Fetch data API
    
    func fetchData(country: String, category: String) {
        WebService.shared.fetchNews(country: country, category: category) { (articles, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let articles = articles {
                for i in 0..<articles.count {
                    self.topHeadlineData.append(articles[i])
                }
            }
            DispatchQueue.main.async {
                self.delegate?.updateTopHeadlineData()
            }
        }
    }
}
