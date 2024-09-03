//
//  HomeView.swift
//  Fitness App
//
//  Created by Admin on 02/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var calories : Int = 123
    @State var active : Int = 52
    @State var stand : Int = 8
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                
                Text("Welcome").font(.largeTitle).padding()
                
                HStack{
                    
                    Spacer()
                    VStack{
                        VStack(alignment : .leading,spacing: 8 ){
                            Text("Calories").font(.callout).bold().foregroundColor(.red)
                            Text("123 kcal").bold()
                                
                        }
                        .padding(.bottom)
                        
                        VStack(alignment : .leading,spacing: 8 ){
                            Text("Active").font(.callout).bold().foregroundColor(.green)
                            Text("52 mins").bold()
                        }
                        .padding(.bottom)

                        VStack(alignment : .leading,spacing: 8 ){
                            Text("Stand").font(.callout).bold().foregroundColor(.blue)
                            Text("8 hours").bold()
                        }
                    }
                    Spacer()
                    
                    ZStack{
                        ProgressCircleView(color: .red, goal: 600, progess: $calories)
                        ProgressCircleView(color: .green, goal: 60, progess: $active)
                            .padding(20)
                        ProgressCircleView(color: .blue, goal: 12, progess: $stand)
                            .padding(40)
                    }.padding(.horizontal)
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}
