//
//  ChallengeButtonView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 15/11/24.
//

import SwiftUI

struct ChallengeButtonView: View {
    
    var text: String
    var role: ButtonRole
    @Binding var isButtonEnabled: Bool
    @State var rotationAmount: Double = 0
    let action: (ButtonRole) -> Void
    
    var body: some View {
        Button(text, role: role) {
            // Perform spin animation around y axis
            withAnimation {
                rotationAmount = role == .destructive ? 360 : -360
            }
            action(role)
        }
        .padding(50)
        .foregroundStyle(.white)
        .font(.headline)
        .background(role == .destructive ? .blue : .red)
        .clipShape(.circle)
        .disabled(!isButtonEnabled)
        .opacity(isButtonEnabled ? 1 : 0.5)
        .animation(.easeIn(duration: 0.4), value: isButtonEnabled)
        .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ChallengeButtonView(text: "Done", role: .destructive, isButtonEnabled: .constant(true), action: { role in print(role)})
}
