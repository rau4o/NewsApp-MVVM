//
//  TopHeadlineViewModel.swift
//  NewsAppMVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

class TopHeadlineViewModel {
    
    var topHeadlineData: [Articles] = []
    weak var delegate: TopHeadlineViewModelDelegate?
    
    func numberOfElements() -> Int {
        return topHeadlineData.count
    }
    
    func getElement(at row: Int) -> Articles {
        return topHeadlineData[row]
    }
    
    func fetchData() {
        WebService.shared.fetchNews(country: "us", category: "general") { (articles, error) in
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
