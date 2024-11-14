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
                VStack {
                    ForEach(pleasureViewModel.pleasures) { pleasure in
                        NavigationLink {
                            // Levels View
                            LevelsView(title: pleasure.name, challenges: pleasure.challenges)
                        } label: {
                            // Card View
                            PleasureCardView(name: pleasure.name)
                        }

                    }
                }
            }
            .navigationTitle("Pleasures")
        }
    }
}

#Preview {
    PleasureView()
        .environment(PleasureViewModel())
}
