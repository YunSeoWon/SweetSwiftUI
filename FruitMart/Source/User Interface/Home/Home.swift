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
    
    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
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

