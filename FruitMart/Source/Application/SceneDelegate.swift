//
//  SceneDelegate.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      configureAppearance()
    
    let rootView = MainTabView()
          .environmentObject(
            ProductViewModel(
                service: ProductService(
                    clientPort: FileProductClientAdapter(filename:"ProductData.json")
                )
            )
          )
          .environmentObject(
            OrderViewModel(
                service: OrderService(
                    clientPort: NoopOrderClientAdapter()
                )
            )
          )
    
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: rootView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }
    
    private func configureAppearance() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "peach")!
        ]
        
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(named: "peach")
        ]
        
        UISlider.appearance().thumbTintColor = UIColor(named: "peach")
    }
}
