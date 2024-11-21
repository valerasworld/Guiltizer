//
//  PleasureView.swift
//  Pleasuroo
//
//  Created by Valery Zazulin and Saverio Negro on 13/11/24.
//

import SwiftUI

struct PleasureView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                ScrollView {
                    VStack {
                        ForEach(pleasureViewModel.pleasures.indices, id: \.self) { index in
                            let pleasure = pleasureViewModel.pleasures[index]
                            NavigationLink {
                                // Levels View
                                LevelsView(title: pleasure.name, image: pleasure.imageName, pleasureIndex: index)
                            } label: {
                                // Card View
                                PleasureCardView(name: pleasure.name, image: pleasure.imageName, pleasureIndex: index, numChallenges: pleasure.challenges.count)
                                    .padding(.horizontal, 20)
                            }

                        }
                    }
                }
            }
            .navigationTitle("Guilty Pleasures")
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: "bitcoinsign.circle.fill")
                        Text("\(pleasureViewModel.coins)")
                    }
                    .padding()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    DevilAngelBarView(barWidth: 300, barHeight: 20, progressType: .total)
                }
            }
        }
    }
}

#Preview {
    PleasureView()
        .environment(PleasureViewModel())
}
