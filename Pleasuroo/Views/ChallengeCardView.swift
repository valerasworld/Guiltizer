//
//  ChallengeCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct ChallengeCardView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    let pleasureIndex: Int
    var challenge: Challenge
    @State var isDragDisabled: Bool = false
    
    func completeChallenge(role: ButtonRole) -> Void {
        let pleasure = pleasureViewModel.pleasures[pleasureIndex]
        let challenges = pleasureViewModel.pleasures[pleasureIndex].challenges
        
        // Complete challenge
        challenge.isComplete = true
        
        // Unlock the next challenge
        let challengeIndex = challenge.level - 1
        let isLastChallenge = challenge.level == challenges.count
        if !isLastChallenge {
            challenges[challengeIndex + 1].isLocked.toggle()
        }
        
        // Check whether the challenge is done in an angelic or devil way
        challenge.isDoneAngelWay = role == .destructive ? true : false
        
        // Add points consequently
        if challenge.isDoneAngelWay {
            pleasure.devilAngel += 1
        } else {
            pleasure.devilAngel -= 1
        }
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.cyan, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ZStack {
                VStack {
                    Text(challenge.title)
                        .challengeTitleText(color: .white)
                    // Image Placeholder
                    Image(challenge.imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 20))
                        .frame(width: 400, height: 200)
                    // -----------------
                    Spacer()
                    Text(challenge.description)
                        .challengeDescriptionText(color: .white)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding(80)
                CircleView(isDragDisabled: $isDragDisabled)
                VStack {
                    Spacer()
                    HStack(spacing: 100) {
                        ChallengeButtonView(text: "Refuse", role: .cancel, isButtonEnabled: $isDragDisabled, action: completeChallenge)
                        ChallengeButtonView(text: "Done", role: .destructive, isButtonEnabled: $isDragDisabled, action: completeChallenge)
                    }
                }
            }
            .padding()
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ChallengeCardView(
        pleasureIndex: 0,
        challenge: Challenge(
        level: 1,
        title: "My Favorite Meal",
        shortDescription: "Enjoy your favorite junk food.",
        description: "Have a taste at your ever-chased-after junk food, and don't forget to enjoy it.",
        imageName: "junk_food",
        isLocked: false,
        isComplete: false,
        isDoneAngelWay: false
    ), isDragDisabled: false)
    .environment(PleasureViewModel())
}
