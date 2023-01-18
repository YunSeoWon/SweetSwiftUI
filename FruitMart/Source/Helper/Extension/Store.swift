//
//  Store.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/18.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

final class Store {
    var products: [Product]
    
    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
