//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var viewModel: ProductViewModel
    @State private var quickOrder: Product?
    @State private var showingFavoriteImage: Bool = true
    
    private var showFavorite: Bool {
        !viewModel.favoriteProducts.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if showFavorite {
                    favoriteProducts
                }
                darkerDivider
                productList
            }
            .navigationBarTitle("과일마트")
        } .popupOverContext(
            item: $quickOrder,
            style: .blur,
            content: popupMessage(product:)
        )
    }
    
    private var favoriteProducts: some View {
        FavoriteProductSrcollView(showingImage: $showingFavoriteImage)
            .padding(.top, 24)
            .padding(.bottom, 8)
    }
    
    private var darkerDivider: some View {
        Color.primary
            .opacity(0.3)
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
    
    private var productList: some View {
        List(viewModel.products) { product in
            NavigationLink(destination: ProductDetailView(product: product)) {
                ProductRow(product: product, quickOrder: self.$quickOrder)
            }
        }
    }
    
    func popupMessage(product: Product) -> some View {
        let name = product.name.split(separator: " ").last!
        
        return VStack {
            Text(name)
                .font(.title).bold().kerning(3)
                .foregroundColor(.peach)
                .padding()
            
            OrderCompletedMessage()
        }
    }
}

struct Home_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview(
            source: Home()
                .environmentObject(
                    ProductViewModel(
                        service: ProductService(
                            clientPort: FileProductClientAdapter(filename: "ProductData.json")
                        )
                    )
                )
                .environmentObject(
                    OrderViewModel(
                        service: OrderService(clientPort: NoopOrderClientAdapter())
                    )
                )
        )
    }
}

