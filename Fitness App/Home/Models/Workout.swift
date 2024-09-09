//
//  Workout.swift
//  Fitness App
//
//  Created by Admin on 05/09/2024.
//

import Foundation
import SwiftUI


struct Workout{
    
    let id : Int?
    let title : String
    let image : String
    let tintColor : Color
    let duration : String
    let date : String
    let calories : String
    
   static let example = Workout(id: 0, title: "Running", image: "figure.run", tintColor: .green, duration: "43 mins", date: "Aprial 20, 2024", calories: "121 Kcal")
    
    static var list = [ Workout(id: 1, title: "Running", image: "figure.run", tintColor: .blue, duration: "43 mins", date: "Aprial 10, 2024", calories: "121 Kcal"),
                        Workout(id: 2, title: "Running", image: "figure.run", tintColor: .green, duration: "3 mins", date: "Augest 2, 2024", calories: "11 Kcal"),
                        Workout(id: 3, title: "Running", image: "figure.run", tintColor: .gray, duration: "23 mins", date: "October 12, 2024", calories: "21 Kcal"),
                        Workout(id: 4, title: "Running", image: "figure.run", tintColor: .red, duration: "48 mins", date: "Aprial 3, 2024", calories: "23 Kcal")]
    
}
