//
//  AngelBackgroundView.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 02/07/25.
//


import SwiftUI

struct AngelBackgroundView: View {
    
    var body: some View {
        Rectangle()
            .ignoresSafeArea()
            .foregroundStyle(Gradient(colors: [.angel, .white]))
    }
}