//
//  HomeViewmodel.swift
//  Fitness App
//
//  Created by Admin on 05/09/2024.
//

import Foundation


class HomeViewmodel : ObservableObject{
    
    let healthManager = HealthManager.shared
    
    @Published var calories : Int = 123
    @Published var exersice : Int = 52
    @Published var stand : Int = 8
    
    @Published var activities = [Activity]()
    @Published var workouts = [Workout]()
    
    init(){
        Task{
            do{
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayExcersie()
                fetchTodayStand()
                fetchTodaysStep()
                fetchCurrentWeekActivities()
                fetchRecentWorkouts()
              
              
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
    func fetchTodayCalories(){
        healthManager.fetchTodayCaloriesBurned { result in
            switch result{
            case .success(let calories) :
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                    let activity = Activity( title: "Calories Burn", subtitle: "Today", image: "flame", tintColor: .red, amount: "\(Int(calories))")
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    func fetchTodayExcersie(){
        
          healthManager.fetchTodayExcersieTime { result in
              switch result{
              case .success(let exersice) :
                  DispatchQueue.main.async {
                      self.exersice = Int(exersice)
                  }            
              case .failure(let failure):
                   print(failure.localizedDescription)
              }
          }
    }
    func fetchTodayStand(){
        healthManager.fetchTodayStandHours { result in
            switch result{
            case .success(let hours) :
                DispatchQueue.main.async {
                    self.stand = Int(hours)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
//    Mark : Fitness Activity
    
    func fetchTodaysStep(){
        
        healthManager.fetchTodaySteps { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.activities.append(success)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCurrentWeekActivities(){
        healthManager.fetchCurrentWeekWorkoutStats { result in
     
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.activities.append(contentsOf: success)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchRecentWorkouts(){
        healthManager.fetchWorkoutsForMonth(month: Date()) { results in
            switch results {
            case .success(let success):
                DispatchQueue.main.async {
                    self.workouts = success
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
