//
//  CircleView.swift
//  Pleasuroo
//
//  Created by Saverio Negro on 15/11/24.
//

import SwiftUI

struct CircleView: View {
    
    @State var yDragAmount: CGFloat
    let maxDragAmount: CGFloat = 500
    
    var body: some View {
        Circle()
            .fill(.yellow)
            .frame(width: 1000)
            .offset(x: 0, y: yDragAmount)
            .gesture(
                DragGesture()
                    .onChanged { attributes in
                        let yTranslation = attributes.translation.height
                        let isDragDisabled = yDragAmount > (maxDragAmount - 25)
                        let canDrag = !isDragDisabled && yTranslation >= 200 && yTranslation <= maxDragAmount
                        
                        if canDrag {
                            yDragAmount = attributes.translation.height
                        }
                    }
                
                    .onEnded { attributes in
                        
                        let yTranslation = attributes.translation.height
                        let isDragDisabled = yDragAmount > (maxDragAmount - 25)
                        
                        withAnimation(
                            Animation.spring(duration: 0.8, bounce: 0.6)
                        ) {
                            if !isDragDisabled {
                                yDragAmount = yDragAmount < (maxDragAmount - 25) ? 200 : yTranslation
                            }
                        }
                    }
                )
        .onAppear {
            withAnimation(
                Animation.linear(duration: 0.5)
                    .repeatCount(5, autoreverses: true)
            ) {
                yDragAmount = 150
            }
        }
    }
}

#Preview {
    CircleView(yDragAmount: 200)
}
