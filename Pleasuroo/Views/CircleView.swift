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
    let tolerance: Double = 10
    @Binding var isDragDisabled: Bool
    
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: 1000)
            .offset(x: 0, y: yDragAmount)
            .gesture(
                DragGesture()
                    .onChanged { attributes in
                        let yTranslation = attributes.translation.height
                        isDragDisabled = yDragAmount > (maxDragAmount - tolerance)
                        let canDrag = !isDragDisabled && yTranslation >= 200 && yTranslation <= maxDragAmount
                        
                        if canDrag {
                            yDragAmount = attributes.translation.height
                        }
                    }
                
                    .onEnded { attributes in
                        
                        let yTranslation = attributes.translation.height
                        isDragDisabled = yDragAmount > (maxDragAmount - tolerance)
                        
                        withAnimation(
                            Animation.spring(duration: 0.8, bounce: 0.6)
                        ) {
                            if !isDragDisabled {
                                yDragAmount = yDragAmount < (maxDragAmount - tolerance) ? 200 : yTranslation
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
    CircleView(yDragAmount: 200, isDragDisabled: .constant(false))
}
