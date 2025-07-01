//
//  ConstantFloatingMovement.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 02/07/25.
//


import SwiftUI

struct ConstantFloatingMovement: ViewModifier {
    var time: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(.white.opacity(0.0001))
            .drawingGroup()
            .distortionEffect(
                ShaderLibrary.floating(
                    .float(time)
                ), maxSampleOffset: .zero)
    }
}

extension View {
    func constantFloatingMovement(time: CGFloat) -> some View {
        modifier(ConstantFloatingMovement(time: time))
    }
}