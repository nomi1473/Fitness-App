//
//  ProgressCircleView.swift
//  Fitness App
//
//  Created by Admin on 03/09/2024.
//

import SwiftUI

struct ProgressCircleView: View {
    
    var color : Color
    var goal : Int
    var width : CGFloat = 20
    @Binding var progess : Int
    
    var body: some View {
        ZStack{
            Circle().stroke(color.opacity(0.3),lineWidth: width)
            
            Circle().trim(from: 0, to: CGFloat(progess) / CGFloat(goal)).stroke(color,style: StrokeStyle(lineWidth: width,lineCap: .round))
                .rotationEffect(.degrees(-90))
                .shadow(radius: 5)
        }
        .padding()
    }
}

#Preview {
    ProgressCircleView(color: .red, goal: 200, progess: .constant(50))
}
