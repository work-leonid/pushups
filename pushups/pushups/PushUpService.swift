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
    
    var pushUpsCurrentWorkoutString: String {
        let arr = pushUpsCurrentWorkout.map { String($0) }
        let str = arr.joined(separator: ", ")
        return str
    }
    
    var pushUpsByDaysString: [String] {
        var str = [String]()
        for i in pushUpsByDays.indices {
            let arr = pushUpsByDays[i].map { String($0) }
            let strin = arr.joined(separator: ", ")
            str.append(strin)
        }
        return str
    }
    
    func incrementPushUps() -> Int {
        pushUpCount += 1
        return pushUpCount
    }
    
    func dicrementPushUps() -> Int {
        if pushUpCount == 0 {
            pushUpCount = 0
        } else {
            pushUpCount -= 1
        }
        return pushUpCount
    }
    
    func addToCurrentDayWorkout() {
        if pushUpCount > 0 {
            pushUpsCurrentWorkout.append(pushUpCount)
            pushUpCount = 0
        }
    }
    
    func saveDay() {
        if !pushUpsCurrentWorkout.isEmpty {
            pushUpsByDays.append(pushUpsCurrentWorkout)
            pushUpCount = 0
            pushUpsCurrentWorkout = [Int]()
        }
    }
}
