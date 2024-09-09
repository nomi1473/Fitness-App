//
//  HKWorkoutActivityType.swift
//  Fitness App
//
//  Created by Admin on 09/09/2024.
//

import HealthKit
import SwiftUI

extension HKWorkoutActivityType {
    
    /*
     Simple mapping of available workout types to a human readable name.
     */
    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"
            
            // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"
            
            // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"
            
            // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"
            
            // Catch-all
        default:                            return "Other"
        }
    }
    
    var image: String {
        switch self {
        case .americanFootball:             return "sportscourt"
        case .archery:                      return "target"
        case .australianFootball:           return "flag.circle"
        case .badminton:                    return "figure.badminton"
        case .baseball:                     return "baseball"
        case .basketball:                   return "sportscourt"
        case .bowling:                      return "figure.bowling"
        case .boxing:                       return "figure.boxing"
        case .climbing:                     return "figure.climbing"
        case .crossTraining:                return "figure.cross.training"
        case .curling:                      return "sportscourt"
        case .cycling:                      return "bicycle"
        case .dance:                        return "figure.dance"
        case .danceInspiredTraining:        return "figure.dance"
        case .elliptical:                   return "figure.elliptical"
        case .equestrianSports:             return "hare"
        case .fencing:                      return "figure.fencing"
        case .fishing:                      return "drop"
        case .functionalStrengthTraining:   return "figure.strengthtraining.functional"
        case .golf:                         return "golf"
        case .gymnastics:                   return "figure.gymnastics"
        case .handball:                     return "figure.handball"
        case .hiking:                       return "figure.hiking"
        case .hockey:                       return "figure.hockey"
        case .hunting:                      return "scope"
        case .lacrosse:                     return "figure.lacrosse"
        case .martialArts:                  return "figure.martial.arts"
        case .mindAndBody:                  return "brain.head.profile"
        case .mixedMetabolicCardioTraining: return "figure.cross.training"
        case .paddleSports:                 return "figure.rowing"
        case .play:                         return "play"
        case .preparationAndRecovery:       return "figure.stretch"
        case .racquetball:                  return "tennis.racket"
        case .rowing:                       return "figure.rowing"
        case .rugby:                        return "figure.rugby"
        case .running:                      return "figure.run"
        case .sailing:                      return "sailboat"
        case .skatingSports:                return "figure.skating"
        case .snowSports:                   return "snowflake"
        case .soccer:                       return "soccerball"
        case .softball:                     return "sportscourt"
        case .squash:                       return "tennis.racket"
        case .stairClimbing:                return "figure.stairs"
        case .surfingSports:                return "waveform"
        case .swimming:                     return "figure.swimming"
        case .tableTennis:                  return "sportscourt"
        case .tennis:                       return "tennis.racket"
        case .trackAndField:                return "figure.track.and.field"
        case .traditionalStrengthTraining:  return "figure.strengthtraining.traditional"
        case .volleyball:                   return "sportscourt"
        case .walking:                      return "figure.walk"
        case .waterFitness:                 return "figure.swimming"
        case .waterPolo:                    return "figure.waterpolo"
        case .waterSports:                  return "figure.rowing"
        case .wrestling:                    return "figure.wrestling"
        case .yoga:                         return "figure.yoga"
            
            // iOS 10
        case .barre:                        return "figure.barre"
        case .coreTraining:                 return "figure.strengthtraining.core"
        case .crossCountrySkiing:           return "figure.cross.country.skiing"
        case .downhillSkiing:               return "figure.skiing.downhill"
        case .flexibility:                  return "figure.stretch"
        case .highIntensityIntervalTraining:return "figure.strengthtraining.hiit"
        case .jumpRope:                     return "figure.jumprope"
        case .kickboxing:                   return "figure.martial.arts"
        case .pilates:                      return "figure.pilates"
        case .snowboarding:                 return "figure.snowboarding"
        case .stairs:                       return "figure.stairs"
        case .stepTraining:                 return "figure.steptraining"
        case .wheelchairWalkPace:           return "figure.roll.walk"
        default : return "figure.stairs"
            
            
        }
    }
    
    
    var color: Color {
           switch self {
           case .americanFootball:             return .red
           case .archery:                      return .green
           case .australianFootball:           return .yellow
           case .badminton:                    return .blue
           case .baseball:                     return .orange
           case .basketball:                   return .purple
           case .bowling:                      return .gray
           case .boxing:                       return .red
           case .climbing:                     return .brown
           case .crossTraining:                return .cyan
           case .curling:                      return .blue
           case .cycling:                      return .green
           case .dance:                        return .pink
           case .danceInspiredTraining:        return .purple
           case .elliptical:                   return .blue
           case .equestrianSports:             return .brown
           case .fencing:                      return .gray
           case .fishing:                      return .blue
           case .functionalStrengthTraining:   return .orange
           case .golf:                         return .green
           case .gymnastics:                   return .purple
           case .handball:                     return .red
           case .hiking:                       return .green
           case .hockey:                       return .blue
           case .hunting:                      return .brown
           case .lacrosse:                     return .orange
           case .martialArts:                  return .red
           case .mindAndBody:                  return .purple
           case .mixedMetabolicCardioTraining: return .pink
           case .paddleSports:                 return .blue
           case .play:                         return .yellow
           case .preparationAndRecovery:       return .gray
           case .racquetball:                  return .purple
           case .rowing:                       return .blue
           case .rugby:                        return .green
           case .running:                      return .red
           case .sailing:                      return .blue
           case .skatingSports:                return .cyan
           case .snowSports:                   return .white
           case .soccer:                       return .green
           case .softball:                     return .orange
           case .squash:                       return .purple
           case .stairClimbing:                return .gray
           case .surfingSports:                return .blue
           case .swimming:                     return .cyan
           case .tableTennis:                  return .green
           case .tennis:                       return .green
           case .trackAndField:                return .yellow
           case .traditionalStrengthTraining:  return .orange
           case .volleyball:                   return .yellow
           case .walking:                      return .gray
           case .waterFitness:                 return .cyan
           case .waterPolo:                    return .blue
           case .waterSports:                  return .blue
           case .wrestling:                    return .red
           case .yoga:                         return .purple

           // iOS 10
           case .barre:                        return .purple
           case .coreTraining:                 return .orange
           case .crossCountrySkiing:           return .white
           case .downhillSkiing:               return .white
           case .flexibility:                  return .purple
           case .highIntensityIntervalTraining:    return .red
           case .jumpRope:                     return .yellow
           case .kickboxing:                   return .red
           case .pilates:                      return .purple
           case .snowboarding:                 return .white
           case .stairs:                       return .gray
           case .stepTraining:                 return .orange
           case .wheelchairWalkPace:           return .gray
           case .wheelchairRunPace:            return .gray

           // iOS 11
           case .taiChi:                       return .purple
           case .mixedCardio:                  return .pink
           case .handCycling:                  return .green

           // iOS 13
           case .discSports:                   return .yellow
           case .fitnessGaming:                return .pink

           // Catch-all
           default:                            return .gray
           }
       }
}
