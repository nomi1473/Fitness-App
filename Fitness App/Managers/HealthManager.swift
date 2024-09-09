//
//  HealthManager.swift
//  Fitness App
//
//  Created by Admin on 06/09/2024.
//

import Foundation
import HealthKit
import SwiftUI

extension Date{
    static var startOfDate : Date{
        let calender = Calendar.current
        return calender.startOfDay(for: Date())
    }
    static var startOfWeek : Date{
        let calender = Calendar.current
        var components = calender.dateComponents([.yearForWeekOfYear,.weekOfYear], from: Date())
        components.weekday = 2
        return calender.date(from: components) ?? Date()
    }
    
    func fetchMonthStartAndEndDate() -> (Date,Date){
        let calander = Calendar.current
        let startDateComponent = calander.dateComponents([.year, .month], from: calander.startOfDay(for: self))
        let startDate = calander.date(from: startDateComponent) ?? self
        let endDate = calander.date(byAdding: DateComponents(month : 1, day: 1), to: startDate) ?? self
        return (startDate, endDate)
    }
}

extension Double{
    
    func formattedNumberString() -> String{
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}

class HealthManager{
    
    static let shared = HealthManager()
    
    let healthStore = HKHealthStore()
    
    private init(){
        
        Task{
            do{
                try await requestHealthKitAccess()
                
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func requestHealthKitAccess() async throws {
        
        let calories = HKQuantityType(.activeEnergyBurned)
        let excersice = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        let steps = HKQuantityType(.stepCount)
        let workouts = HKSampleType.workoutType()
        let healtTypes : Set = [calories, excersice, stand, steps,workouts]
        
        try await healthStore.requestAuthorization(toShare:[],read: healtTypes)
    }
    
    
    func fetchTodayCaloriesBurned(comletion : @escaping(Result<Double, Error>) -> Void){
        
        let calories  = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query  = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else{
                comletion(.failure(URLError(.badURL)))
                return
            }
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            comletion(.success(calorieCount))
            
        }
        healthStore.execute(query)
        
    }
    func fetchTodayExcersieTime(comletion : @escaping(Result<Double, Error>) -> Void){
        
        let excersice = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query  = HKStatisticsQuery(quantityType: excersice, quantitySamplePredicate: predicate) { _, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else{
                comletion(.failure(URLError(.badURL)))
                return
            }
            let excersieTime = quantity.doubleValue(for: .minute())
            comletion(.success(excersieTime))
            
        }
        healthStore.execute(query)
        
    }
    func fetchTodayStandHours(comletion : @escaping(Result<Double, Error>) -> Void){
        
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query  = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, results, error in
            guard let samples = results as? [HKCategorySample], error == nil else{
                comletion(.failure(URLError(.badURL)))
                return
            }
            print(samples)
            print(samples.map({ $0.value
            }))
            
            comletion(.success(2.0))
            
        }
        healthStore.execute(query)
        
    }
    
    //    MARK: Fintensss Activity
    func fetchTodaySteps(completion : @escaping(Result<Activity,Error>) -> Void){
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query  = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else{
                completion(.failure(URLError(.badURL)))
                return
            }
            let steps = quantity.doubleValue(for: .minute())
            let activity = Activity(title: "Today Steps", subtitle: "Goal : 800", image: "figure.walk", tintColor: .blue, amount: "\(Int(steps))")
            completion(.success(activity))
            
        }
        healthStore.execute(query)
        
    }
    
    func fetchCurrentWeekWorkoutStats(completion : @escaping(Result<[Activity],Error>) -> Void){
        
        let workout = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { [weak self] _, results, error in
            guard let workouts = results as? [HKWorkout], let self = self, error == nil else{
                completion(.failure(URLError(.badURL)))
                return
            }
            
            var runningCount = 0
            var strengthCount = 0
            var soccerCount = 0
            var basketBallCount = 0
            var stairsCount = 0
            var kickboxingCount = 0
            
            for workout in workouts{
                let duration = Int(workout.duration) / 60
                if workout.workoutActivityType == .running {
                    runningCount += duration
                }
                else if workout.workoutActivityType == .soccer {
                    soccerCount += duration
                }
                else if workout.workoutActivityType == .traditionalStrengthTraining {
                    strengthCount += duration
                }
                else if workout.workoutActivityType == .baseball {
                    basketBallCount += duration
                }
                else if workout.workoutActivityType == .stairs {
                    stairsCount += duration
                }
                else if workout.workoutActivityType == .kickboxing {
                    kickboxingCount += duration
                }
            }
            let list = generateActivitiesFromDuations(running: runningCount, strength: strengthCount, soccer: soccerCount, basketball: basketBallCount, stairs: stairsCount, kickboxing: kickboxingCount)
            completion(.success(list))
        }
        healthStore.execute(query)
    }
    
    func generateActivitiesFromDuations(running : Int, strength : Int, soccer : Int, basketball : Int, stairs : Int, kickboxing : Int) -> [Activity]{
        
        
        
        return [
            Activity(title: "Running", subtitle: "This week", image: "figure.run", tintColor: .green, amount: "\(running)"),
            Activity(title: "Strength Training", subtitle: "This week", image: "dumbbell", tintColor: .blue, amount: "\(strength)"),
            Activity(title: "Soccer", subtitle: "This week", image: "figure.soccer", tintColor: .indigo, amount: "\(soccer)"),
            Activity(title: "Basketball", subtitle: "This week", image: "figure.basketball", tintColor: .green, amount: "\(basketball)"),
            Activity(title: "Stairsstepper", subtitle: "This week", image: "figure.stairs", tintColor: .green, amount: "\(stairs)"),
            Activity(title: "KickBoxing", subtitle: "This week", image: "figure.kickboxing", tintColor: .green, amount: "\(kickboxing)"),
        ]
    }
    
    
    //   mark: Recent Workouts
    func fetchWorkoutsForMonth(month : Date, completion : @escaping (Result<[Workout],Error>) -> Void) {
        
        let workout = HKSampleType.workoutType()
        let (startDate, endDate) = month.fetchMonthStartAndEndDate()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        
        let query1 = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { _, results, error in
            guard let workouts = results as? [HKWorkout], error == nil else{
                completion(.failure(URLError(.badURL)))
                return
            }
            
            let workoutsArray = workouts.map ({
                let calories : Double = $0.totalEnergyBurned?.doubleValue(for: .kilocalorie()) ?? 0.0
               return  Workout(id : nil ,title: $0.workoutActivityType.name, image: $0.workoutActivityType.image, tintColor: $0.workoutActivityType.color, duration: "\($0.duration / 60)", date: "\($0.startDate)", calories:  String(format: "%.0f", calories))
            })
            completion(.success(workoutsArray))
            
        }
        healthStore.execute(query1)
    }
    
}

