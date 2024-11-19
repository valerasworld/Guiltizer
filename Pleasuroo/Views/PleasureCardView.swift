//
//  PleasureCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct PleasureCardView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    let name: String
    let image: String
    let pleasureIndex: Int
    let numChallenges: Int
    
    var body: some View {
        ZStack {
                Color.devil
                .frame(height: 200)
                .clipShape(.rect(cornerRadius: 20))
                .overlay {
                    HStack(spacing: 10) {
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 150, maxHeight: 200)
                            .clipShape(.rect(cornerRadius: 20))
                            .padding(.vertical, 30)
                            .padding(.horizontal, 0)
                            .clipped()
                        VStack {
                            VStack(alignment: .leading) {
                                // Pleasure Name
                                Text("\(name)")
                                    .font(.title2).bold()
                                    .foregroundStyle(.blackish)
                                // Number of Challenges
                                Text("\(numChallenges) Challenges")
                                    .font(.subheadline)
                                    .foregroundStyle(.blackish)
                                // Devil / Angel Progress
                                DevilAngelBarView(barWidth: 150, barHeight: 10, pleasureIndex: pleasureIndex, progressType: .pleasure)
                                    .environment(pleasureViewModel)
                                    .shadow(radius: 4, x: 6)
                            }
                            .frame(maxWidth: 150)
                        }
                    }
                }
        }
    }
}

#Preview {
    PleasureCardView(name: "Junk Food", image: "junk_food", pleasureIndex: 0, numChallenges: 5)
        .environment(PleasureViewModel())
}
