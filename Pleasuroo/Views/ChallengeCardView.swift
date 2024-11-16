//
//  ChallengeCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct ChallengeCardView: View {
    
    let challenge: Challenge
    @State var isDragDisabled: Bool = false
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.cyan, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ZStack {
                VStack {
                    Text(challenge.title)
                        .challengeTitleText(color: .white)
                    // Image Placeholder
                    Image("burger")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 20))
                        .frame(width: 400, height: 200)
                    // -----------------
                    Text(challenge.description)
                        .challengeDescriptionText(color: .white)
                    Spacer()
                }
                .padding(80)
                CircleView(yDragAmount: 200, isDragDisabled: $isDragDisabled)
                VStack {
                    Spacer()
                    HStack(spacing: 100) {
                        ChallengeButtonView(text: "Refuse", role: .cancel, isButtonEnabled: $isDragDisabled)
                        ChallengeButtonView(text: "Done", role: .destructive, isButtonEnabled: $isDragDisabled)
                    }
                }
            }
            .padding()
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ChallengeCardView(challenge: Challenge(
        level: 1,
        title: "My Favorite Meal",
        shortDescription: "Enjoy your favorite junk food.",
        description: "Have a taste at your ever-chased-after junk food, and don't forget to enjoy it.",
        imageName: "junkfood",
        isLocked: false,
        isDoneAngelWay: false
    ), isDragDisabled: false)
}
