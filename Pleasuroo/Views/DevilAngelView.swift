//
//  DevilAngelView.swift
//  Pleasuroo
//
//  Created by Valery Zazulin on 14/11/24.
//

import SwiftUI

struct DevilAngelView: View {
    
    @Environment(PleasureViewModel.self) var pleasureViewModel
    @State var isAngel: Bool = true

//    var isAngelBool = { pleasureViewModel.getTotalDevilAngelPoints() >= 0 ? true : false }
    
    @State private var offset = CGSize(width: 0, height: 0)
    @State private var floatingOffset: Double = 7
//    @Binding var isAngel: Bool /*{ isAngelic }*/ /*= true*/
    @State private var floatingToggle: Bool = true
    @State var projection: CGFloat = 0
    
    //    @State private var screenSize: CGSize = .zero
    
    let devilPoint: CGSize = CGSize(width: -10, height: 150)
    let angelPoint: CGSize = CGSize(width: 10, height: -150)
    var startingPoint: CGSize { isAngel ? angelPoint : devilPoint }
    
    var stickBackAnimation: Animation = .spring(duration: 0.4, bounce: 0.1, blendDuration: 5.9)
    
    var body: some View {
        
        
        
        let farFromInitialPoint = hypot((isAngel ? angelPoint.width : devilPoint.width) - offset.width,
                                        (isAngel ? angelPoint.height : devilPoint.height) - offset.height)
        let farFromOppositePoint = hypot((isAngel ? devilPoint.width : angelPoint.width) - offset.width,
                                         (isAngel ? devilPoint.height : angelPoint.height) - offset.height)
        
        let initSqrd: CGFloat = farFromInitialPoint * farFromInitialPoint
        
        let halfPerimeter: CGFloat = (300 + farFromInitialPoint + farFromOppositePoint) / 2
        let heightLength: CGFloat = (2 / 300) * sqrt(halfPerimeter * (halfPerimeter - farFromInitialPoint) * (halfPerimeter - farFromOppositePoint) * (halfPerimeter - 300))
        let heightSqrd: CGFloat = heightLength * heightLength
        let projectionMultiplier: CGFloat = sqrt((initSqrd) - (heightSqrd)) / 300
        
        
        
        ZStack {
            // Angel BG
            AngelBackgroundView()
            
            // Angel View
            ZStack {
                Image("angel").resizable().scaledToFill()
                    .offset(y: floatingOffset * (floatingToggle ? -1 : 1))
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: floatingToggle)
            }
            .frame(width: 150, height: 250)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.offset = CGSize(
                            width: startingPoint.width + value.translation.width,
                            height: startingPoint.height + value.translation.height
                        )
                        
                        if farFromOppositePoint >= 300 && farFromInitialPoint <= 300{
                            projection = 0
                        }
                        
                        if farFromInitialPoint <= farFromOppositePoint {
                            projection = projectionMultiplier * 2
                        }
                        
                    }
                    .onEnded { _ in
                        withAnimation(stickBackAnimation) {
                            offset = startingPoint
                            projection = 0
                        }
                        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                            floatingToggle.toggle()
                        }
                    })
            
            // Devil BG
            DevilBackgroundView(isAngel: $isAngel, projection: $projection)
            
            // Devil View
            ZStack {
                Image("devil").resizable().scaledToFill()
                    .offset(y: floatingOffset * (floatingToggle ? -1 : 1))
            }
            .frame(width: 150, height: 250)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.offset = CGSize(
                            width: startingPoint.width + value.translation.width,
                            height: startingPoint.height + value.translation.height
                        )
                        
                        if farFromOppositePoint >= 300 && farFromInitialPoint <= 300{
                            projection = 0
                        }
                        
                        if farFromInitialPoint <= farFromOppositePoint {
                            projection = projectionMultiplier * 2
                        }
                    }
                    .onEnded { _ in
                        withAnimation(stickBackAnimation) {
                            offset = startingPoint
                            projection = 0
                        }
                        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                            floatingToggle.toggle()
                        }
                    })
            
            // Devil Mask
            .mask {
                Triangle(isAngel: $isAngel, projection: $projection)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
            }
            
            // - - - Utilities
            //                VStack {
            //                    Spacer()
            //                    Button("Toggle") {
            //                        withAnimation(.easeInOut) {
            //                            isAngel.toggle()
            //                        }
            //                    }
            //                    Text(verbatim: "\(Int(offset.width/* - angelPoint.width)*/))" + "\n" + "\(Int(offset.height/* - angelPoint.height*/))")
            //                    Text(Int(borderOffset).description)
            ////                    Text(screenSize.debugDescription)
            ////                    Text("ScreenCenter: \(screenCenter.debugDescription)")
            ////                    Text("ViewPos: \(Int(viewPosition.x)); \(Int(viewPosition.y))")
            ////                    Text("FromCenter: \(Int(farFromCenter))")
            //
            //                    Text("From POINT: \(Int(farFromInitialPoint))")
            //                    Text("From OPPOSITE: \(Int(farFromOppositePoint))")
            //                    Text("BORDER OFFSET: \(Int(borderOffset))")
            //                    Text("PROJECTION M: \(projectionMultiplier)")
            //                }
        }
        //
        .onAppear {
            isAngel = pleasureViewModel.getIsAngelOrDevil()
            offset = startingPoint
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                floatingToggle.toggle()
            }
        }
        .onChange(of: isAngel) { _, _ in
            withAnimation {
                offset = startingPoint
                //                    projection = 0
            }
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                floatingToggle.toggle()
            }
        }
    }
}



//}

struct Triangle: Shape {
    
    @Binding var isAngel: Bool
    //    @Binding var borderOffset: Double
    @Binding var projection: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .init(
                x: rect.maxX * (isAngel ?
                                findBorderOffset(
                                    offset: projection,
                                    minOffset: 1,
                                    maxOffset: 0,
                                    borderValueMin: 1.3,
                                    borderValueMax: 0.7
                                )
                                : findBorderOffset(
                                    offset: projection,
                                    minOffset: 1,
                                    maxOffset: 0,
                                    borderValueMin: 0.7,
                                    borderValueMax: 1.3
                                )),
                y: rect.maxY)) // maxX * isAngel ? 0.7 : 1.3
            path.addLine(to: .init(x: rect.minX, y: rect.maxY))
            path.addLine(to: .init(
                x: rect.minX,
                y: rect.maxY * (isAngel ?
                                findBorderOffset(
                                    offset: projection,
                                    minOffset: 1,
                                    maxOffset: 0,
                                    borderValueMin: -0.3,
                                    borderValueMax: 0.3
                                )
                                : findBorderOffset(
                                    offset: projection,
                                    minOffset: 1,
                                    maxOffset: 0,
                                    borderValueMin: 0.3,
                                    borderValueMax: -0.3
                                )))) // maxY * isAngel ? 0.3 : -0.3
        }
        
    }
    
    func findBorderOffset(offset: CGFloat, minOffset: CGFloat, maxOffset: CGFloat, borderValueMin: CGFloat, borderValueMax: CGFloat) -> CGFloat {
        let borderOffset = findNumberInInterpolatedRange(
            number: offset,
            lowestData: minOffset,
            highestData: maxOffset,
            rangeMin: borderValueMin,
            rangeMax: borderValueMax
        )
        
        return borderOffset
    }
    
    func findNumberInInterpolatedRange(number: CGFloat, lowestData: CGFloat, highestData: CGFloat, rangeMin: CGFloat, rangeMax: CGFloat) -> CGFloat {
        
        let normalisedNumber = (((number - lowestData) * (rangeMax - rangeMin)) / (highestData - lowestData)) + rangeMin
        
        return normalisedNumber
    }
}

struct AngelBackgroundView: View {
    
    var body: some View {
        Rectangle()
            .ignoresSafeArea()
            .foregroundStyle(Gradient(colors: [.angel, .white]))
    }
}

struct DevilBackgroundView: View {
    
    @Binding var isAngel: Bool
    //    @Binding var borderOffset: Double
    @Binding var projection: CGFloat
    
    var body: some View {
        Triangle(isAngel: $isAngel, projection: $projection)
            .ignoresSafeArea()
            .foregroundStyle(Gradient(colors: [.black, .red]))
    }
}

#Preview {
    DevilAngelView()
        .environment(PleasureViewModel())
}
