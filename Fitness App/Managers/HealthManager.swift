//
//  HealthManager.swift
//  Fitness App
//
//  Created by Admin on 06/09/2024.
//

import Foundation
import HealthKit

extension Date{
    static var startOfDate : Date{
        let calender = Calendar.current
        return calender.startOfDay(for: Date())
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
        
        let healtTypes : Set = [calories, excersice, stand]
        
        try await healthStore.requestAuthorization(toShare:[],read: healtTypes)
    }
    
    
    func fetchTodayCaloriesBurned(comletion : @escaping(Result<Double, Error>) -> Void){
        
        let calories  = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDate, end: Date())
        let query  = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in
            
            guard let quantity = results?.sumQuantity(), error == nil else{
                comletion(.failure(NSError()))
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
                comletion(.failure(NSError()))
                return
            }
            print(samples)
            print(samples.map({ $0.value
            }))
            
            comletion(.success(2.0))
            
        }
        healthStore.execute(query)
        
    }
}
