//
//  ProductService.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/19.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

class ProductService {
    
    private let clientPort: ProductClientPort
    
    init(clientPort: ProductClientPort) {
        self.clientPort = clientPort
    }
    
    func getAll() -> [Product] {
        return clientPort.getAll()
    }
}
