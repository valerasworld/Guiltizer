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
                ScrollView {
                    VStack {
                        ForEach(pleasureViewModel.pleasures.indices, id: \.self) { index in
                            let pleasure = pleasureViewModel.pleasures[index]
                            NavigationLink {
                                // Levels View
                                LevelsView(title: pleasure.name, image: pleasure.imageName, pleasureIndex: index, challenges: pleasure.challenges)
                            } label: {
                                // Card View
                                PleasureCardView(name: pleasure.name, image: pleasure.imageName, numChallenges: pleasure.challenges.count)
                            }

                        }
                    }
                }
            }
            .navigationTitle("Guilty Pleasures")
        }
    }
}

#Preview {
    PleasureView()
        .environment(PleasureViewModel())
}
