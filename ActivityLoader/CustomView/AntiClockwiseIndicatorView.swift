

//
//  AntiClockwiseIndicatorView.swift
//  ActivityLoader
//
//  Created by Sushanth on 01/06/24.
//

import SwiftUI

struct AntiClockwiseIndicatorView: View {
    @State var progress = 0.0
    @State var progress1 = 0.0
   
    private func startAnimation() {
           withAnimation(Animation.linear(duration: 1.0)) {
               progress = 0
           }
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               progress = 1.0
               startAnimation()
           }
    }
    
    private func startAnimationfForSecondCircle() {
           withAnimation(Animation.linear(duration: 1.0)) {
               progress1 = 1
           }
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               progress1 = 0.0
               startAnimationfForSecondCircle()
           }
    }
    
    var body: some View {
        
        ZStack {
            var viewHeight = 10.0
            ForEach(1..<5) { index in
                ZStack {
                    
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(Color.red, lineWidth: 5)
                       // .frame(width: 16, height: 16)
                        //.offset(x: 0, y: 200)
                        .rotationEffect(Angle(degrees: Double(-180 * index)))
                    
//                    Circle()
//                        .trim(from: 0.1, to: progress1)
//                        .stroke(Color.white, lineWidth: 5)
//                        .rotationEffect(Angle(degrees: -90))
//                       // .frame(width: 100, height: 100)
//
//                    Circle()
//                        .trim(from: 0.2, to: progress)
//                        .stroke(Color.red, lineWidth: 5)
//                       // .frame(width: 16, height: 16)
//                        //.offset(x: 0, y: 200)
//                        .rotationEffect(Angle(degrees: -90))
//                    Circle()
//                        .trim(from: 0.3, to: progress1)
//                        .stroke(Color.white, lineWidth: 5)
//                        .rotationEffect(Angle(degrees: -90))
//                       // .frame(width: 100, height: 100)
//                    Circle()
//                        .trim(from: 0.4, to: progress)
//                        .stroke(Color.red, lineWidth: 5)
//                       // .frame(width: 16, height: 16)
//                        //.offset(x: 0, y: 200)
//                        .rotationEffect(Angle(degrees: -90))
//                    Circle()
//                        .trim(from: 0.5, to: progress1)
//                        .stroke(Color.white, lineWidth: 5)
//                        .rotationEffect(Angle(degrees: -90))
//                       // .frame(width: 100, height: 100)
//                    Circle()
//                        .trim(from: 0.6, to: progress)
//                        .stroke(Color.red, lineWidth: 5)
//                       // .frame(width: 16, height: 16)
//                        //.offset(x: 0, y: 200)
//                        .rotationEffect(Angle(degrees: -90))
//                    Circle()
//                        .trim(from: 0.7, to: progress1)
//                        .stroke(Color.white, lineWidth: 5)
//                        .rotationEffect(Angle(degrees: -90))
//                       // .frame(width: 100, height: 100)
//                    Circle()
//                        .trim(from: 0.8, to: progress)
//                        .stroke(Color.red, lineWidth: 5)
//                       // .frame(width: 16, height: 16)
//                        //.offset(x: 0, y: 200)
//                        .rotationEffect(Angle(degrees: -90))
//                    Circle()
//                        .trim(from: 0.9, to: progress1)
//                        .stroke(Color.white, lineWidth: 5)
//                        .rotationEffect(Angle(degrees: -90))
                    
                } .frame(width: viewHeight * (5 * Double(index)), height: viewHeight * (5 * Double(index)))
                   // .rotationEffect(Angle(degrees: index / 2 == 0 ?  -80 : -90))
            }
        
           
    
                
            
               // .frame(width: 100, height: 100)
            
            
            
                
        }
        .onAppear(perform: {
            
            startAnimation()
            startAnimationfForSecondCircle()
//
//            withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: true)) {
//                               progress = 1.0
//                           }

          //  progress = 0.40
        })
        
        .padding()
    }
}

#Preview {
    AntiClockwiseIndicatorView()
}
