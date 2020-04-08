//
//  WebService.swift
//  NewsAppMVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Moya

class WebService: NSObject {
    
    static let shared = WebService()
    var networkManager = MoyaProvider<NetworkManager>()
    
    func fetchNews(country: String, category: String, completion: @escaping([Articles]?, Error?) -> Void) {
        networkManager.request(.getNews(country: country, category: category)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let news = try JSONDecoder().decode(TopHeadline.self, from: response.data).articles
                    completion(news,nil)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
