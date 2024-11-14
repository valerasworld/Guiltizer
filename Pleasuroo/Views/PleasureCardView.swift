//
//  PleasureCardView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 14/11/24.
//

import SwiftUI

struct PleasureCardView: View {
    
    let name: String
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 200)
                .clipShape(.rect(cornerRadius: 20))
                .padding(20)
            
            Text("\(name)")
                .font(.title).bold()
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    PleasureCardView(name: "Junk Food")
}
