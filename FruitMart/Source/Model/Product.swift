//
//  Product.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/19.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let name: String
    let imageName: String
    let price: Int
    let description: String
    var isFavorite: Bool = false
    let id: UUID = UUID()
}

extension Product: Identifiable {}
