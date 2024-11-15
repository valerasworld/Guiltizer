//
//  ChallengeCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct ChallengeCardView: View {
    
    let challenge: Challenge
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ZStack {
                VStack {
                    Text(challenge.title)
                        .challengeText(color: .white)
                    Spacer()
                    Text(challenge.description)
                        .challengeText(color: .white)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .frame(width: 350)
                    Spacer()
                }
                .padding(50)
                CircleView(yDragAmount: 200)
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
        description: "Enjoy your favorite amazing junk food. Enjoy your favorite junk food.",
        imageName: "junkfood",
        isLocked: false,
        isDoneAngelWay: false
    ))
}
