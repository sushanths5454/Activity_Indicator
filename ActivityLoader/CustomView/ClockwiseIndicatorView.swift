//
//  ClockwiseIndicatorView.swift
//  ActivityLoader
//
//  Created by Sushanth on 01/06/24.
//

import SwiftUI

struct ClockwiseIndicatorView: View {
    @State var progress = 0.0
    @State var progress1 = 0.0
    var repeatCount: Int
    private func startAnimation() {
        withAnimation(Animation.linear(duration: 0.3)) {
               progress = 1
           }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
               progress = 0
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
            ZStack {
              ForEach(0..<repeatCount, id: \.self) { index in
                  let start = CGFloat(index) / CGFloat(repeatCount)
                  let end = CGFloat(index + 1) / CGFloat(repeatCount)
                  
                  Circle()
                      .trim(from: start, to: progress * (end - start) + start)
                      .stroke(index % 2 == 0 ? (progress == 1 ?Color.orange : Color.yellow) : (progress == 1 ?Color.yellow : Color.orange), lineWidth: 2)
                      .rotationEffect(.degrees(-90))
              }
          }
          .onAppear {
              startAnimation()
          }
        }
        .onAppear(perform: {
            startAnimation()
        })
    }
}

#Preview {
    ClockwiseIndicatorView( repeatCount: 4)
}
