//
//  WorkoutCard.swift
//  Fitness App
//
//  Created by Admin on 05/09/2024.
//

import SwiftUI




struct WorkoutCard: View {
    
    @State var workout : Workout
    var body: some View {

        HStack{
            Image(systemName: workout.image).resizable().scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundStyle(workout.tintColor)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
            VStack(spacing : 16){
                HStack{
                    Text(workout.title).font(.title3).bold().lineLimit(1).minimumScaleFactor(0.5)
                    Spacer()
                    Text(workout.duration)
                }
                
                HStack{
                    Text(workout.date)
                    Spacer()
                    Text(workout.calories)
                }
            }
        }.padding(.horizontal)
    }
}

#Preview {
    WorkoutCard(workout: .example)
}
