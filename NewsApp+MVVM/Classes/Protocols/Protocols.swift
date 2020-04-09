//
//  Protocols.swift
//  NewsAppMVVM
//
//  Created by rau4o on 4/8/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

protocol TopHeadlineViewModelDelegate: class {
    func updateViewModelData()
}

protocol TopHeadlineControllerDelegate: class {
    func updateData()
}
