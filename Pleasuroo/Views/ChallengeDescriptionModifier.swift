//
//  ChallengeTextModifier.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 15/11/24.
//

import SwiftUI

extension View {
    func challengeText(color: Color) -> some View {
        modifier(ChallengeDescriptionModifier(color: color))
    }
}

struct ChallengeDescriptionModifier: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(color)
    }
}
