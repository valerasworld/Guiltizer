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
    @Binding var isDragDisabled: Bool
    @Binding var isDoneDevilWay: Bool
    @Binding var isComplete: Bool
    var isButtonEnabled: Bool {
        return (isDoneDevilWay && role == .destructive) || (isDragDisabled && !isComplete)
    }
    @State var rotationAmount: Double = 0
    let action: () -> Void
    
    var body: some View {
        Button(text, role: role) {
            // Perform spin animation around y axis
            withAnimation {
                rotationAmount = role == .destructive ? 360 : -360
            }
            action()
        }
        .padding(25)
        .foregroundStyle(.blackish)
        .font(.headline)
        .background(role == .destructive ? .angel : .devil)
        .clipShape(.circle)
        .disabled(!isButtonEnabled)
        .opacity(isButtonEnabled ? 1 : 0.5)
        .animation(.easeIn(duration: 0.4), value: isButtonEnabled)
        .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    ChallengeButtonView(text: "Angel\nWay", role: .destructive, isDragDisabled: .constant(false), isDoneDevilWay: .constant(true), isComplete: .constant(true), action: {})
}
