//
//  Symbol.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/05.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct Symbol: View {
    let systemName: String
    let imageScale: Image.Scale
    let color: Color?
    
    init(
        _ systemName: String,
        scale imageScale: Image.Scale = .medium,
        color: Color? = nil
    ) {
        self.systemName = systemName
        self.imageScale = imageScale
        self.color = color
    }
    
    var body: some View {
        Image(systemName: systemName)
            .imageScale(imageScale)
            .foregroundColor(color)
    }
}
