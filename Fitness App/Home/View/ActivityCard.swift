//
//  ActivityCard.swift
//  Fitness App
//
//  Created by Admin on 03/09/2024.
//

import SwiftUI



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
