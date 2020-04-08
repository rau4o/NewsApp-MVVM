//
//  TopHeadline.swift
//  NewsApp+MVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

struct TopHeadline: Decodable {
    let articles: [Articles]
}

struct Articles: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlImage: String?
    let publishedAt: String?
    let content: String?
}
