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
                .clipShape(.rect(cornerRadius: 40))
                .overlay {
                    HStack(spacing: 16) {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 150, maxHeight: 200)
                            .clipShape(.rect(cornerRadius: 20))
                            .padding(.vertical, 30)
                            .padding(.horizontal, 0)
                            .clipped() // ???
                        VStack {
                            VStack(alignment: .leading) {
                                // Pleasure Name
                                Text("\(name)")
                                    .multilineTextAlignment(.leading)
                                    .font(.title).bold()
                                    .foregroundStyle(.blackish)
                                // Number of Challenges
                                Text("\(numChallenges) Challenges")
                                    .font(.subheadline)
                                    .foregroundStyle(.blackish)
                                // Devil / Angel Progress
                                DevilAngelBarView(barWidth: 150, barHeight: 10, pleasureIndex: pleasureIndex, progressType: .pleasure)
                                    .environment(pleasureViewModel)
                                    .shadow(color: .blackish.opacity(0.6), radius: 4, x: 5, y: 1)
                            }
                            .frame(maxWidth: 150)
                        }
                    }
                }
        }
    }
}

#Preview {
    PleasureCardView(name: "Binge Watching", image: "junk_food", pleasureIndex: 0, numChallenges: 5)
        .environment(PleasureViewModel())
}
