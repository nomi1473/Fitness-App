//
//  Activity.swift
//  Fitness App
//
//  Created by Admin on 05/09/2024.
//

import Foundation
import SwiftUI


struct Activity {
    let title : String
    let subtitle : String
    let image : String
    let tintColor : Color
    let amount : String
    
    
  
    static let example = Activity(title: "Toadys Stps", subtitle: "Goal 10000", image: "figure.walk", tintColor: .green, amount: "342")
    
    static let mockActivities = [Activity(title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9,824"),
                                 Activity(title: "Today", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9,824"),
                                 Activity(title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "32,824"),
                                 Activity(title: "Today steps", subtitle: "Goal 12,000", image: "figure.run", tintColor: .purple, amount: "10,824"),]
}
