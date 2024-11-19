//
//  LevelsView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 13/11/24.
//

import SwiftUI

struct LevelsView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    
    let title: String
    let image: String
    let pleasureIndex: Int
    var challenges: [Challenge] {
        pleasureViewModel.pleasures[pleasureIndex].challenges
    }
    @State var challengesCompleted = 0.0
    let columns = [
        /// The grid will fit in as many items per row as possible (`.adaptive()`)
        /// using a minimum size of 50 points and a maximum size of 100 points.
        /// GridItem(.adaptive(minimum: 50, maximum: 100))
        
        /// Control the number of columns to have using `.flexible()`.
        /// `.flexible()` lets you specify how big each item should be, while
        /// controlling how many columns there are.
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.flexible(minimum: 50, maximum: 100))
        
        /// Make one of the columns (first) fixed in size, while letting the other/s
        /// adapt and fill up the remaining space.
        //        GridItem(.fixed(50)),
        //        GridItem(.flexible(minimum: 50, maximum: .infinity))
    ]
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                ProgressView(value: challengesCompleted, total: Double(challenges.count))
                    .frame(width: 300)
                    .tint(.red)
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(challenges) { challenge in
                        NavigationLink {
                            ChallengeCardView(pleasureIndex: pleasureIndex, challenge: challenge)
                                .toolbar(.hidden, for: .tabBar)
                        } label: {
                            LevelCardView(level: challenge.level, pleasureIndex: pleasureIndex)
                                .environment(pleasureViewModel)
                        }
                        .disabled(challenge.isLocked)
                    }
                }
                .padding(.vertical, 20)
                Spacer()
            }
            .padding(.vertical, 20)
        }
        .navigationTitle("\(title)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            challengesCompleted = Double(pleasureViewModel.getNumChallengesDone(pleasureIndex: pleasureIndex))
        }
    }
}

#Preview {
    LevelsView(
        title: "Junk Food",
        image: "junk_food",
        pleasureIndex: 0
    )
    .environment(PleasureViewModel())
}
