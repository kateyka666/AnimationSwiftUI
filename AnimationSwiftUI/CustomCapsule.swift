//
//  CustomCapsule.swift
//  AnimationSwiftUI
//
//  Created by Екатерина Боровкова on 14.08.2021.
//

import SwiftUI

struct CustomCapsule: View {
    @State private var showMove = false
   
    var body: some View {
        ZStack{
            ForEach(0..<15) { iteration in
                Capsule()
                    .stroke(lineWidth: 3)
                    .frame(width: CGFloat(iteration) * 20, height: CGFloat(iteration) * 25)
                    .foregroundColor(.orange)
                    .rotation3DEffect(
                        .degrees(75),
                        axis: (x: 1, y: 0, z: 0)
                    )
                    .offset(y: showMove ?  -150 : 150)
                    .animation(.easeInOut(duration: 1.8).repeatForever(autoreverses: true).delay(Double(iteration) * 0.1))
                    .onAppear{
                         self.showMove.toggle()
                    }

            }

        }
    }
}
struct RoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CustomCapsule()
    }
}
