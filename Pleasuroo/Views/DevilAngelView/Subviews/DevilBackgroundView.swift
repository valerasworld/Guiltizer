//
//  DevilBackgroundView.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 02/07/25.
//


import SwiftUI

struct DevilBackgroundView: View {
    
    @Binding var isAngel: Bool
    @Binding var projection: CGFloat
    
    var body: some View {
        Triangle(isAngel: $isAngel, projection: $projection)
            .ignoresSafeArea()
            .foregroundStyle(Gradient(colors: [.black, .red]))
    }
}