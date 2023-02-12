//
//  HideRowSeparatorModifier.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/12.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct HideRowSeparatorModifier: ViewModifier {

    static let defaultListRowHeight: CGFloat = 44

    var insets: EdgeInsets
    var background: Color

    init(insets: EdgeInsets, background: Color) {
        self.insets = insets
        self.background = background
    }

    func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
            minWidth: 0, maxWidth: .infinity,
            minHeight: Self.defaultListRowHeight,
            alignment: .leading
        )
            .listRowInsets(EdgeInsets())
            .background(background)
    }
}

extension EdgeInsets {

    static let defaultListRowInsets = Self(top: 0, leading: 16, bottom: 0, trailing: 16)
}

extension View {

    func hideRowSeparator(
        insets: EdgeInsets = .defaultListRowInsets,
        background: Color = .white
    ) -> some View {
        modifier(HideRowSeparatorModifier(
            insets: insets,
            background: background
            ))
    }
}
