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
            RadialGradient(colors: [.white, .blue], center: .bottom, startRadius: 550, endRadius: 552)
                .ignoresSafeArea()
            VStack {
                Text("\(challenge.title)")
                    .font(.title2)
                Spacer()
            }
        }
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
