//
//  ChallengeCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct ChallengeCardView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    @Environment(\.dismiss) var dismiss
    
    let pleasureIndex: Int
    @Bindable var challenge: Challenge
    @State var isDragDisabled: Bool = false
    @State var buttonOffset: CGFloat = 400
    
    func completeChallenge(role: ButtonRole) -> Void {
        let pleasure = pleasureViewModel.pleasures[pleasureIndex]
        let challenges = pleasureViewModel.pleasures[pleasureIndex].challenges
        
        // Unlock the next challenge
        let challengeIndex = challenge.level - 1
        let isLastChallenge = challenge.level == challenges.count
        if !isLastChallenge {
            challenges[challengeIndex + 1].isLocked = false
        }
        
        // Check whether the user has already done the challenge in a devil way
        if challenge.isDoneDevilWay {
            challenge.isDoneDevilWay = false
            pleasure.devilAngelPoints += 2
        }
        
        // Check whether the challenge is done in an angelic or devil way
        challenge.isDoneAngelWay = role == .destructive ? true : false
        
        // Make sure the challenge is yet to complete before adding points
        if !challenge.isComplete {
            // Add points consequently
            if challenge.isDoneAngelWay {
                pleasureViewModel.coins += 1
                pleasure.devilAngelPoints += 1
            } else {
                pleasure.devilAngelPoints -= 1
            }
        }
        
        // Complete challenge
        challenge.isComplete = true
    }
    
    var body: some View {
        
        ZStack {
            Color.black
            ZStack {
                VStack {
                    Text(challenge.title)
                        .challengeTitleText(color: .devil)
                    // Image Placeholder
                    Image("eyes")
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 20))
                        .frame(width: 320, height: 200)
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
                CircleView(isDragDisabled: $isDragDisabled, isComplete: $challenge.isComplete, buttonOffset: $buttonOffset)
                VStack {
                    Spacer()
                    HStack(spacing: 140) {
                        ChallengeButtonView(text: "Devil\nWay", role: .cancel, isDragDisabled: $isDragDisabled, isDoneDevilWay: $challenge.isDoneDevilWay, isComplete: $challenge.isComplete) {
                            completeChallenge(role: .cancel)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                dismiss()
                            }
                        }
                        ChallengeButtonView(text: "Angel\nWay", role: .destructive, isDragDisabled: $isDragDisabled, isDoneDevilWay: $challenge.isDoneDevilWay, isComplete: $challenge.isComplete) {
                            completeChallenge(role: .destructive)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                dismiss()
                            }
                        }
                    }
                }
                .offset(x: 0, y: buttonOffset)
                .onChange(of: buttonOffset) {
                    print(buttonOffset)
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
