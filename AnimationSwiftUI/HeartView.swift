//
//  HeartView.swift
//  AnimationSwiftUI
//
//  Created by Екатерина Боровкова on 13.08.2021.
//

import SwiftUI

struct HeartView: View {
    @State private var trim: CGFloat = 0.0
    @State var shape: Bool = false
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            
            Button(action: { shape.toggle()}) {
                Text("Animate")
            }
          
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let nearLine = size * 0.1
            let farLine = size * 0.9
            let middle = size / 2
            
            if shape{
                Path { path in
                path.move(to: CGPoint(x: middle, y: nearLine + 25))
                path.addQuadCurve(
                    to: CGPoint(x: farLine, y: middle),
                    control: CGPoint(x: size, y: 0)
                )
                path.addLine(to: CGPoint(x: middle, y: farLine))
                path.addLine(to: CGPoint(x: nearLine, y: middle))
                path.addQuadCurve(
                    to: CGPoint(x: middle, y: nearLine + 25),
                    control: CGPoint(x: 0, y: 0)
                )
                }.trim(from: 0, to: trim)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 4,  dash: [5,5]))
                .shadow(color: .red.opacity(0.8), radius: 20, x: 0, y: 2)
                .animation(.easeOut(duration: 3).delay(0.5).repeatForever(autoreverses: true))
                .onAppear{
                    self.trim = 1.0
                }
                
        } else {
            Path { path in
                path.move(to: CGPoint(x: middle, y: nearLine + 75))
                path.addCurve(to: CGPoint(x: middle, y: nearLine + 150), control1: CGPoint(x: farLine, y: nearLine + 45), control2: CGPoint(x: middle, y: nearLine + 150))
                path.addCurve(to: CGPoint(x: middle, y: nearLine + 75), control1: CGPoint(x: nearLine, y: nearLine + 45), control2: CGPoint(x: middle, y: nearLine + 75))
            }
            .fill(RadialGradient(
                gradient: Gradient(colors: [.white, .red]),
                center: UnitPoint(x: 0.5, y: 0.6),
                startRadius: geometry.size.width * 0.005,
                endRadius: geometry.size.width * 0.6
            ))
        }
        }
        .frame(width: width, height: height)
        .padding()
    }
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView( width: 200, height: 200)
    }
}
