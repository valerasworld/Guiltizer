//
//  CharacterView.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 02/07/25.
//

import SwiftUI

struct CharacterView: View {
    
    var character: CharacterType
    @Binding var viewModel: DevilAngelViewModel
    var time: CGFloat
    
    var body: some View {
        ZStack {
            Image(character.imageName)
                .resizable()
                .scaledToFill()
                .padding(50)
                .constantFloatingMovement(time: time)
        }
        
        .frame(width: 200, height: 300)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .offset(viewModel.offset)
        .gesture(
            DragGesture()
                .onChanged { value in
                    viewModel.offset = CGSize(
                        width: viewModel.startingPoint.width + value.translation.width,
                        height: viewModel.startingPoint.height + value.translation.height
                    )
                    
                    if viewModel.farFromOppositePoint >= 300 && viewModel.farFromInitialPoint <= 300 {
                        viewModel.projection = 0
                    }
                    
                    if viewModel.farFromInitialPoint <= viewModel.farFromOppositePoint {
                        viewModel.projection = viewModel.projectionMultiplier * 2
                    }
                    
                }
                .onEnded { _ in
                    withAnimation(viewModel.stickBackAnimation) {
                        viewModel.projection = 0
                        viewModel.offset = viewModel.startingPoint
                        
                    }
                })
    }
}
