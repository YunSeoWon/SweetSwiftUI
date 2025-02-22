//
//  ShapeClipModifier.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/18.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct ShapeClipModifier<S: Shape>: ViewModifier {
    let shape: S
    
    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

struct ShapeClipModifier_Previews: PreviewProvider {
    static var previews: some View {
        
        let ratio: [CGFloat] = [0.1, 0.3, 0.5, 0.7, 0.9]
        
        let insertion = ratio.map { Stripes(ratio: $0) }
        
        let removal = ratio.map {
            Stripes(insertion: false, ratio: 1 - $0)
        }
        
        let image = ResizedImage(recipeSamples[0].imageName, contentMode: .fit)
        
        return HStack {
            ForEach([insertion, removal], id: \.self) { type in
                VStack {
                    ForEach(type, id: \.self) {
                        image.modifier(ShapeClipModifier(shape: $0))
                    }
                }
            }
        }
    }
}
