//
//  PleasurooApp.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 13/11/24.
//

import SwiftUI

@main
struct PleasurooApp: App {
    
    @State var pleasureViewModel = PleasureViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Pleasures", systemImage: "flame.fill") {
                    PleasureView()
                        .environment(pleasureViewModel)
                }
                
                Tab("Shop", systemImage: "cart.fill") {
                        Circle()
                        .frame(width: 200)
                }
            }
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                // Modify the background color of the tab bar
//                appearance.backgroundColor = .blue
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            .tint(.blue)
        }
    }
}
