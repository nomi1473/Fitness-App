//
//  HomeView.swift
//  Fitness App
//
//  Created by Admin on 02/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewmodel = HomeViewmodel()
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(alignment : .leading){
                    
                    Text("Welcome").font(.largeTitle).padding()
                    
                    HStack{
                        
                        Spacer()
                        VStack{
                            VStack(alignment : .leading,spacing: 8 ){
                                Text("Calories").font(.callout).bold().foregroundColor(.red)
                                Text("\(viewmodel.calories)").bold()
                                    
                            }
                            .padding(.bottom)
                            
                            VStack(alignment : .leading,spacing: 8 ){
                                Text("Active").font(.callout).bold().foregroundColor(.green)
                                Text("\(viewmodel.exersice)").bold()
                            }
                            .padding(.bottom)

                            VStack(alignment : .leading,spacing: 8 ){
                                Text("Stand").font(.callout).bold().foregroundColor(.blue)
                                Text("\(viewmodel.stand)").bold()
                            }
                        }
                        Spacer()
                        
                        ZStack{
                            ProgressCircleView(color: .red, goal: 600, progess: ($viewmodel.calories))
                            ProgressCircleView(color: .green, goal: 60, progess: ($viewmodel.exersice))
                                .padding(20)
                            ProgressCircleView(color: .blue, goal: 12, progess: $viewmodel.stand)
                                .padding(40)
                        }.padding(.horizontal)
                        Spacer()
                    }
                    .padding()
                    
                    HStack{
                        Text("Fitness Activity").font(.title2)
                        Spacer()
                        
                        Button{
                            print("show more")
                        }label: {
                            Text("Show more").padding(.horizontal,10).padding(.vertical,5).foregroundStyle(.white).background(.blue)
                                .cornerRadius(24).font(.callout)
                        }
                    }.padding(.horizontal)
                    LazyVGrid(columns: Array(repeating: GridItem(spacing : 20), count: 2)){
                        ActivityCard(activity: .mockActivities[0])
                        ActivityCard(activity: .mockActivities[1])
                        ActivityCard(activity: .mockActivities[3])
                        ActivityCard(activity: .mockActivities[2])
                    }.padding(.horizontal)
                    
                    HStack{
                        Text("Recent Workouts").font(.title2)
                        Spacer()
                        
                        NavigationLink{
                            EmptyView()
                        } label : {
                            Text("Show more").padding(.horizontal,10).padding(.vertical,5).foregroundStyle(.white).background(.blue)
                                .cornerRadius(24).font(.callout)
                        }
  

                        
                     
                    }.padding()
                    
                    LazyVStack{
                        ForEach(Workout.list,id: \.id){ item in
                            WorkoutCard(workout: item)
                        }
                    }.padding(.horizontal)
                }.padding(.bottom)
            }
        }
    }
}

#Preview {
    HomeView()
}
