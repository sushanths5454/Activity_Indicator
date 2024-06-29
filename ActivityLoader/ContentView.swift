//
//  ContentView.swift
//  ActivityLoader
//
//  Created by Sushanth on 01/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var progress = 0.0
    @State var progress1 = 0.0
   
    private func startAnimation() {
           withAnimation(Animation.linear(duration: 1.0)) {
               progress = 1
           }
           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               progress = 0.0
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
            var viewHeight = 2.0
            ForEach(1..<11) { index in
                ZStack {
                    switch index {
                    case 1:                        ClockwiseIndicatorView( repeatCount: 4)
                            .frame(width: viewHeight * (6 * Double(index)), height: viewHeight * (6 * Double(index)))
                    case 2:
                        AntiClockwiseIndicatorView(progress: 0.0, progress1: 0.0, repeatCount: 4)
                            .frame(width: viewHeight * (5 * Double(index)), height: viewHeight * (5 * Double(index)))
                    case 3:
                        ClockwiseIndicatorView( repeatCount: 9)
                            .frame(width: viewHeight * (6 * Double(index)), height: viewHeight * (5 * Double(index)))
                    case 4:
                        AntiClockwiseIndicatorView(progress: 0.0, progress1: 0.0, repeatCount: 9)
                            .frame(width: viewHeight * (5 * Double(index)), height: viewHeight * (5 * Double(index)))
                    case 5:
                        ClockwiseIndicatorView( repeatCount: 7)
                            .frame(width: viewHeight * (6 * Double(index)), height: viewHeight * (5 * Double(index)))
                    case 6:
                        AntiClockwiseIndicatorView(progress: 0.0, progress1: 0.0, repeatCount: 2)
                            .frame(width: viewHeight * (5 * Double(index)), height: viewHeight * (5 * Double(index)))
                    case 7:
                        ClockwiseIndicatorView(repeatCount: 4)
                            .frame(width: viewHeight * (6 * Double(index)), height: viewHeight * (5 * Double(index)))
                    case 8:
                        AntiClockwiseIndicatorView(progress: 0.0, progress1: 0.0, repeatCount: 6)
                            .frame(width: viewHeight * (5 * Double(index)), height: viewHeight * (5 * Double(index)))
                    case 9:
                        ClockwiseIndicatorView(repeatCount: 3)
                            .frame(width: viewHeight * (6 * Double(index)), height: viewHeight * (5 * Double(index)))
                    case 10:
                        AntiClockwiseIndicatorView(progress: 0.0, progress1: 0.0, repeatCount: 2)
                            .frame(width: viewHeight * (5 * Double(index)), height: viewHeight * (5 * Double(index)))
                        
                        
                        
                    default:
                        AntiClockwiseIndicatorView(progress: 0.0, progress1: 0.0, repeatCount: 2)
                            .frame(width: viewHeight * (5 * Double(index)), height: viewHeight * (5 * Double(index)))
                    }
                }
            }
        }
        .frame(width: 150, height: 150)
        .padding()
    }
}

#Preview {
    ContentView()
}
