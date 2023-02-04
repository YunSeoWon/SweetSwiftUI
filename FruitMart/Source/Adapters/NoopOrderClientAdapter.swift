//
//  NoopOrderClientAdapter.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/04.
//  Copyright © 2023 Giftbot. All rights reserved.
//

class NoopOrderClientAdapter: OrderClientPort {
    private var orderList: [Order] = []
    
    func order(order: Order) -> Bool {
        orderList.append(order)
        
        print("OrderList: \(orderList)")
        return true
    }
}
