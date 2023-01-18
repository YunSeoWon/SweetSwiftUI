//
//  RequestDataPort.swift
//  FruitMart
//
//  Created by beer1     on 2023/01/19.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import Foundation

protocol ProductClientPort {
    
    func getAll() -> [Product]
}
