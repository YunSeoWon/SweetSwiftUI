//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.fetch()) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRow(product: product)
                }
            }
            .navigationBarTitle("과일마트")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(
            viewModel: HomeViewModel(
                productService: ProductService(
                    clientPort: FileProductClientAdapter(filename: "ProductData.json")
                )
            )
        )
    }
}

