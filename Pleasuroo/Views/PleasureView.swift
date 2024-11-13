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
            VStack {
                ForEach(pleasureViewModel.pleasures) { pleasure in
                    NavigationLink {
                        // Levels View
                    } label: {
                        // Card View
                    }

                }
            }
            .navigationTitle("Pleasure")
            .padding()
        }
    }
}

#Preview {
    PleasureView()
        .environment(PleasureViewModel())
}
