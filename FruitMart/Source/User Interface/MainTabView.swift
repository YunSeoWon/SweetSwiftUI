//
//  MainTabView.swift
//  FruitMart
//
//  Created by beer1     on 2023/02/12.
//  Copyright © 2023 Giftbot. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    private enum Tabs {
        case home, recipe, gallery, myPage
    }
    
    @State private var selectedTab: Tabs = .home
    @EnvironmentObject private var viewModel: ProductViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                home
                recipe
                imageGallery
                myPage
            }
            .accentColor(.primary)
        }
        .accentColor(.peach)
        .edgesIgnoringSafeArea(.top)
        .statusBar(hidden: selectedTab == .recipe)
    }
}


fileprivate extension View {
    func tabItem(image: String, text: String) -> some View {
        self.tabItem {
            Symbol(image, scale: .large)
                .font(Font.system(size: 17, weight: .light))
            Text(text)
        }
    }
}

private extension MainTabView {
    var home: some View {
        Home()
            .tag(Tabs.home)
            .tabItem(image: "house", text: "홈")
            .onAppear {
                UITableView.appearance().separatorColor = .clear
                UITableView.appearance().separatorStyle = .none
            }
    }
    
    var recipe: some View {
        RecipeView()
            .tag(Tabs.recipe)
            .tabItem(image: "book", text: "레시피")
    }
    
    var imageGallery: some View {
        ImageGallery(viewModel: viewModel)
            .tag(Tabs.gallery)
            .tabItem(image: "photo.on.rectangle", text: "갤러리")
    }
    
    var myPage: some View {
        Text("마이페이지")
            .tag(Tabs.myPage)
            .tabItem(image: "person", text: "마이페이지")
    }
}


struct MainTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview(
            source: MainTabView()
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


