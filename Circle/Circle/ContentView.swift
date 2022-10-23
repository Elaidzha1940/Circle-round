//
//  ContentView.swift
//  Circle
//
//  Created by Elaidzha Shchukin on 23.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var countdown = 0.0
    var foregroundCircleColor: Color = Color(.brown)
    var backCircleColor: Color = Color(.black)
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    backCircleColor,
                    style: StrokeStyle(lineWidth: 10,
                                       lineCap: .round,
                                       lineJoin: .round)
                    
                )
                .opacity(0.0)
            
            Circle()
                .trim(from: 0, to:
                        CGFloat(countdown))
                .stroke(
                    foregroundCircleColor,
                    style: StrokeStyle(lineWidth: 10,
                                       lineCap: .round,
                                       lineJoin: .round)
                    
                )
                .rotationEffect(.degrees(-90))
                .rotation3DEffect(Angle(degrees: 250),  axis: (x: 1, y: 0, z: 0))
                .foregroundColor(.yellow)
            
            
            Text("\(String(format: "%0.f", min(3, ceil(countdown + 0.1))))")
                .foregroundColor(.brown)
            
        }
        .frame(width: 200, height: 200)
        .padding()
        .onAppear{
            withAnimation(
                .easeOut(duration: 3)) {
                    countdown = 1
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
