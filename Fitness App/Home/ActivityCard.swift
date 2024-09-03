//
//  ActivityCard.swift
//  Fitness App
//
//  Created by Admin on 03/09/2024.
//

import SwiftUI


struct Activity{
    let id : Int
    let title : String
    let subtitle : String
    let image : String
    let tintColor : Color
    let amount : String
    
    
    static let example = Activity(id: 1, title: "Toadys Stps", subtitle: "Goal 10000", image: "figure.walk", tintColor: .green, amount: "342")
    
    static let mockActivities = [Activity(id: 0, title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9,824"),
                                 Activity(id: 1, title: "Today", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9,824"),
                                 Activity(id: 2, title: "Today steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "32,824"),
                                 Activity(id: 3, title: "Today steps", subtitle: "Goal 12,000", image: "figure.run", tintColor: .purple, amount: "10,824"),]
}

struct ActivityCard: View {
    
    @State var activity : Activity
    
    var body: some View {
        ZStack{
            Color(uiColor: .systemGray6).cornerRadius(15)
            VStack{
                
                HStack(alignment : .top){
                    
                    VStack(alignment : .leading){
                        Text(activity.title).font(.callout).fontWeight(.semibold)
                        Text(activity.subtitle).font(.caption2).foregroundStyle(Color(uiColor: .systemGray2))
                    }
                    Spacer()
                    Image(systemName: activity.image).foregroundStyle(activity.tintColor)
                }
                Text(activity.amount).font(.title).fontWeight(.bold)

            }
            .padding()
        }
    }
        
}

#Preview {
    ActivityCard(activity: .example)
}
