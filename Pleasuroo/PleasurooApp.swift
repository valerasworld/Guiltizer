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
            PleasureView()
                .environment(pleasureViewModel)
        }
    }
}
