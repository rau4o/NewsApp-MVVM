//
//  NetworkManager.swift
//  NewsAppMVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Moya
import UIKit

enum NetworkManager {
    case getNews(country: String, category: String)
    case getEverythingNews
}

extension NetworkManager: TargetType {
    var baseURL: URL {
        return URL(string: "http://newsapi.org/v2/")!
    }
    
    var path: String {
        switch self {
            case .getNews:
                return "top-headlines"
            case .getEverythingNews:
                return "everything"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            case .getNews(let country, let category):
                return .requestParameters(parameters: ["country": country, "apiKey": "f12fc7d8e0df4337a19981fea52f3811", "category": category, "pageSize": 15], encoding: URLEncoding.default)
            case .getEverythingNews:
                return .requestParameters(parameters: ["q": "bitcoin", "apiKey": "f12fc7d8e0df4337a19981fea52f3811", "pageSize": 15], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
