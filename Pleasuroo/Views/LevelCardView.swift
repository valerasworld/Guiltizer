//
//  LevelCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct LevelCardView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    let level: Int
    let pleasureIndex: Int
    var challenge: Challenge {
        return pleasureViewModel.pleasures[self.pleasureIndex].challenges[level - 1]
    }
    var isNewChallenge: Bool {
        return !challenge.isLocked && !challenge.isComplete
    }
    @State var scaleEffect = 1.0
    
    // Animate the level card to prompt the user to take on the newly unlocked and
    // yet to complete challenge.
    func userPromptAnimation() {
        var count = 0
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            
            if !isNewChallenge || count == 2 {
                timer.invalidate()
            }
            
            if isNewChallenge {
                withAnimation(
                    Animation.spring(duration: 1.4, bounce: 0.4) // 0.7
                ) {
                    scaleEffect = scaleEffect == 1 ? 0.95 : 1 // 0.85
                }
                scaleEffect = 1
            }
            
            count += 1
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.accent)
                .scaledToFit()
                .frame(maxWidth: 100, maxHeight: 100)
                .clipShape(.rect(cornerRadius: 25))
                .overlay {
                    ZStack {
                        if challenge.isLocked {
                            Image(systemName: "lock.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .padding(10)
                                .opacity(0.2)
                        } else if self.challenge.isComplete {
                            GeometryReader { geometry in
//                                Image(self.challenge.isDoneAngelWay ? "angel_icon" : "devil_icon")
                                Image(self.challenge.isDoneAngelWay ? "angel" : "devil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    
                                    .scaleEffect(0.8)                                    .clipShape(.rect(cornerRadius: 25))
                                    .foregroundStyle(.angel)
                                    .opacity(0.4)
                            }
                        }
                        VStack {
                            if challenge.isComplete {
                                Spacer()
                            }
                            HStack {
                                if challenge.isComplete {
                                    Spacer()
                                }
                                let size = challenge.isComplete ? 25.0 : 50.0
                                let hPadding = challenge.isComplete ? 10.0 : 0
                                let vPadding = challenge.isComplete ? 10.0 : 0
                                Text("\(level)")
                                    .font(Font.system(size: size))
                                    .foregroundStyle(.blackish)
                                    .padding(.horizontal, hPadding)
                                    .padding(.vertical, vPadding)
                                    .bold()
                            }
                        }
                    }
                    
                }
        }
//        .opacity(challenge.isLocked ? 0.9 : 1)
        .scaleEffect(scaleEffect)
        .onAppear {
            userPromptAnimation()
        }
    }
}

#Preview {
    LevelCardView(level: 1, pleasureIndex: 0)
        .environment(PleasureViewModel())
}
