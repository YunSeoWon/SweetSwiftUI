//
//  OrderClientPort.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/04.
//  Copyright © 2023 Giftbot. All rights reserved.
//

protocol OrderClientPort {
    
    func order(order: Order) -> Bool
}
