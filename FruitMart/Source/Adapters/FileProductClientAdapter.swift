//
//  FileDataRequestAdapter.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/19.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

class FileProductClientAdapter : ProductClientPort {
    
    let filename: String
    
    init(filename: String) {
        self.filename = filename
    }
    
    func getAll() -> [Product] {
        return Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
