//
//  StarView.swift
//  AnimationSwiftUI
//
//  Created by Екатерина Боровкова on 13.08.2021.
//

import SwiftUI

struct StarView: View {
    @State var shape: Bool = true
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            
            Button(action: {
                shape.toggle()
            }) {
                Text("Animate")
            }
            GeometryReader { geometry in
                let size = min(geometry.size.width, geometry.size.height)
                let nearLine = size * 0.1
                let farLine = size * 0.9
                let middle = size / 2
                
                if shape {
                    Path{ path in
                        
                        path.move(to: CGPoint(x: middle, y: nearLine))
                        path.addLine(to: CGPoint(x: middle + 20, y: middle - 20))
                        path.addLine(to: CGPoint(x: farLine, y: middle - 20))
                        path.addLine(to: CGPoint(x: middle + 30, y: middle + 20))
                        path.addLine(to: CGPoint(x: farLine, y: farLine))
                        path.addLine(to: CGPoint(x: middle, y: middle + 50))
                        path.addLine(to: CGPoint(x: nearLine, y: farLine))
                        path.addLine(to: CGPoint(x: middle - 30, y: middle + 20))
                        path.addLine(to: CGPoint(x: nearLine, y: middle - 20))
                        path.addLine(to: CGPoint(x: middle - 20, y: middle - 20))
                        path.addLine(to: CGPoint(x: middle, y: nearLine))
                        
                    }
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    
                } else {
                    Path{ path in
                        
                        path.move(to: CGPoint(x: middle, y: nearLine))
                        path.addLine(to: CGPoint(x: middle + 20, y: middle - 20))
                        path.addLine(to: CGPoint(x: farLine, y: middle - 20))
                        path.addLine(to: CGPoint(x: middle + 30, y: middle + 20))
                        path.addLine(to: CGPoint(x: farLine, y: farLine))
                        path.addLine(to: CGPoint(x: middle, y: middle + 50))
                        path.addLine(to: CGPoint(x: nearLine, y: farLine))
                        path.addLine(to: CGPoint(x: middle - 30, y: middle + 20))
                        path.addLine(to: CGPoint(x: nearLine, y: middle - 20))
                        path.addLine(to: CGPoint(x: middle - 20, y: middle - 20))
                        path.addLine(to: CGPoint(x: middle, y: nearLine))
                        
                    }
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .rotation3DEffect(
                        .degrees(140),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .transition(AnyTransition.opacity.combined(with: .slide))
                    .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 1, initialVelocity: 0.1))
                }
                
            }
            .frame(width: width, height: height)
            
        }
    }
    
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(width: 200, height: 200)
    }
}
