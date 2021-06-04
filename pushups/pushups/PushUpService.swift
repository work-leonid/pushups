//
//  PushUpService.swift
//  pushups
//
//  Created by Leonid Nazarov on 04.06.2021.
//

import Foundation

class PushUpService: ObservableObject {
    @Published var pushUpCount = 0
    @Published var pushUpsCurrentWorkout = [Int]()
    @Published var pushUpsByDays = [[Int]]()
    
    private let userDefaults = UserDefaults.standard
    private let userDefaultsPushUpsCountKey = "pushups_count"
    
    var pushUpsCurrentWorkoutString: String {
        let arr = pushUpsCurrentWorkout.map { String($0) }
        let str = arr.joined(separator: ", ")
        return str
    }
    
    var pushUpsByDaysString: String {
//        var str = ""
//        for i in pushUpsByDays.indices {
//            let arr = pushUpsByDays[i].map { String($0) }
//            str = arr.joined(separator: ". ")
//        }
//        print(pushUpsByDays)
//        let flatten = Array(pushUpsByDays.joined())
//        print(flatten)
//        let arr = pushUpsByDays.map { String($0) }
//        let str = arr.joined(separator: ". ")
        return "str"
    }
    
    func increment() -> Int {
        pushUpCount += 1
        return pushUpCount
    }
    
    func addToCurrentDayWorkout() {
        pushUpsCurrentWorkout.append(pushUpCount)
        pushUpCount = 0
    }
    
    func saveDay() {
        pushUpsByDays.append(pushUpsCurrentWorkout)
        pushUpCount = 0
        pushUpsCurrentWorkout = [Int]()
//        for i in pushUpsByDays.indices {
//            print(i)
//        }
    }
}
