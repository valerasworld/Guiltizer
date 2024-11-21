//
//  ChallengeTitleModifier.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 16/11/24.
//

import SwiftUI

extension View {
    func challengeTitleText(color: Color) -> some View {
        modifier(ChallengeTitleModifier(color: color))
    }
}

struct ChallengeTitleModifier: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .foregroundStyle(color)
    }
}
