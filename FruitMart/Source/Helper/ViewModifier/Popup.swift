//
//  Popup.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/05.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

enum PopupStyle {
    case none
    case blur
    case dimmed
}

fileprivate struct Popup<Message: View>: ViewModifier {
    let size: CGSize?
    let style: PopupStyle
    let message: Message
    
    init(
        size: CGSize? = nil,
        style: PopupStyle = .none,
        message: Message
    ) {
        self.size = size
        self.style = style
        self.message = message
    }
    
    func body(content: Content) -> some View {
        content // 팝업창 뷰
            .blur(radius: style == .blur ? 2 : 0)
            .overlay(Rectangle()
                .fill(Color.black.opacity(style == .dimmed ? 0.4 : 0))
            )
            .overlay(popupContent)
    }
    
    // 팝업창으로 표현될 뷰
    private var popupContent: some View {
        GeometryReader {
            let width = self.size?.width ?? $0.size.width * 0.6
            let height = self.size?.height ?? $0.size.height * 0.25
            let x = ($0.size.width - width) / 2
            let y = ($0.size.height - height) / 2

            return VStack { self.message }
                .frame( // 뷰 너비, 높이 지정
                    width: width,
                    height: height
                )
                .background(Color.primary.colorInvert())
                .cornerRadius(12)
                .shadow(color: .primaryShadow, radius: 15, x: 5, y: 5)
                .overlay(self.checkCircleMark, alignment: .top)
                .offset(x: x, y: y)
                
            
        }
    }
    
    private var checkCircleMark: some View {
        Symbol("checkmark.circle.fill", color: .peach)
            .font(Font.system(size: 60).weight(.semibold))
            .background(Color.white.scaleEffect(0.5))
            .offset(x: 0, y: -30)
    }
}

fileprivate struct PopupToggle: ViewModifier {
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content.disabled(isPresented)
            .onTapGesture {
                self.isPresented.toggle()
            }
    }
}

extension View {
    func popup<Content: View>(
        isPresented: Binding<Bool>,
        size: CGSize? = nil,
        style: PopupStyle = .none,
        @ViewBuilder content: () -> Content
    ) -> some View {
        if isPresented.wrappedValue {
            let popup = Popup(size: size, style: style, message: content())
            let popupToggle = PopupToggle(isPresented: isPresented)
            let modifiedContent = self.modifier(popup).modifier(popupToggle)
            return AnyView(modifiedContent)
        } else {
            return AnyView(self)
        }
    }
}

fileprivate struct PopupItem<Item: Identifiable>: ViewModifier {
    @Binding var item: Item?
    func body(content: Content) -> some View {
        content.disabled(item != nil)
            .onTapGesture { self.item = nil }
    }
}

extension View {
    func popup<Content: View, Item: Identifiable>(
        item: Binding<Item?>,
        size: CGSize? = nil,
        style: PopupStyle = .none,
        @ViewBuilder content: (Item) -> Content
    ) -> some View {
        if let selectedItem = item.wrappedValue {
            let content = content(selectedItem)
            let popup = Popup(size: size, style: style, message: content)
            let popupItem = PopupItem(item: item)
            let modifiedContent = self.modifier(popup).modifier(popupItem)
            return AnyView(modifiedContent)
        } else {
            return AnyView(self)
        }
    }
}

extension View {
    func popupOverContext<Item: Identifiable, Content: View>(
        item: Binding<Item?>,
        size: CGSize? = nil,
        style: PopupStyle = .none,
        ignoringEdges edges: Edge.Set = .all,
        @ViewBuilder content: (Item) -> Content
    ) -> some View {
        let isNonNil = item.wrappedValue != nil
        
        return ZStack {
            self.blur(radius: isNonNil && style == .blur ? 2 : 0)
            
            if isNonNil {
                Color.black
                    .luminanceToAlpha() // 휘도를 투명도와 연결해주는 수식어
                    .popup(item: item, size: size, style: style, content: content)
                    .edgesIgnoringSafeArea(edges)
            }
        }
    }
}
