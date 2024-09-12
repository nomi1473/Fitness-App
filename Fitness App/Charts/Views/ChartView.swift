//
//  ChartView.swift
//  Fitness App
//
//  Created by Admin on 09/09/2024.
//

import SwiftUI
import Charts


struct DailyStepModel : Identifiable {
    let id = UUID()
    let date : Date
    let count : Double
    
    static let list = [
        DailyStepModel(date: Date(), count: 12223),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), count: 9242),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(), count: 7242),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(), count: 8221),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(), count: 10242),
        DailyStepModel(date: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(), count: 9242)]
    
    
    static let monthList: [DailyStepModel] = (0..<30).map { dayOffset in
        let date = Calendar.current.date(byAdding: .day, value: -dayOffset, to: Date()) ?? Date()
        let count = Int.random(in: 5000...15000) // Generate random step count
        return DailyStepModel(date: date, count: Double(count))
    }
    static let month3List: [DailyStepModel] = (0..<90).map { dayOffset in
        let date = Calendar.current.date(byAdding: .day, value: -dayOffset, to: Date()) ?? Date()
        let count = Int.random(in: 5000...15000) // Generate random step count
        return DailyStepModel(date: date, count: Double(count))
    }
}

enum ChartOptions : String, CaseIterable {
    case oneWeek = "1W"
    case oneMonth = "1M"
    case threeMonth = "3M"
    case yearToDate = "YTD"
    case oneYear = "1Y"
}


class ChartViewModel : ObservableObject{
    
    
    
}


struct ChartView: View {
    
    @StateObject var viewModel = ChartViewModel()
    @State var selectedChart : ChartOptions = .oneWeek
    var body: some View {
        VStack{
            Text("Charts").font(.largeTitle).bold().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading).padding()
            
            ZStack{
                switch selectedChart {
                case .oneWeek:
                    
                    Chart{
                        ForEach(DailyStepModel.list) { data in
                            BarMark(x: .value(data.date.formatted(),data.date,unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .oneMonth:
                    Chart{
                        ForEach(DailyStepModel.monthList) { data in
                            BarMark(x: .value(data.date.formatted(),data.date,unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .threeMonth:
                    Chart{
                        ForEach(DailyStepModel.month3List) { data in
                            BarMark(x: .value(data.date.formatted(),data.date,unit: .day), y: .value("Steps", data.count))
                        }
                    }
                case .yearToDate:
                    EmptyView()
                case .oneYear:
                    
                    Chart{
                        ForEach(DailyStepModel.list) { data in
                            BarMark(x: .value(data.date.formatted(),data.date,unit: .day), y: .value("Steps", data.count))
                        }
                    }
                }
            }
            .foregroundStyle(.green)
            .frame( maxHeight: 350)
            .padding(.horizontal)
            
            
            HStack{
                ForEach(ChartOptions.allCases, id: \.rawValue) { option in
                    Button(option.rawValue){
                        print(option)
                        withAnimation {
                            selectedChart = option
                        }
                    }.padding(.horizontal).padding(.vertical ,12)
                        .foregroundStyle(selectedChart == option ? .white : .green )
                        .background(selectedChart == option ? .green : .clear)
                        .cornerRadius(8)
                }
            }.padding()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
    }
}

#Preview {
    ChartView()
}
