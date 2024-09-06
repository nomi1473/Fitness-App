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
    
    init(){
        Task{
            do{
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayExcersie()
                fetchTodayStand()
              
              
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
                }            case .failure(let failure):
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
}
