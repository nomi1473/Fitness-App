//
//  HomeViewmodel.swift
//  Fitness App
//
//  Created by Admin on 05/09/2024.
//

import Foundation


class HomeViewmodel : ObservableObject{
    
    @Published var calories : Int = 123
    @Published var active : Int = 52
    @Published var stand : Int = 8
}
