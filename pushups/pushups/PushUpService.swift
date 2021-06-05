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
    @Published var endWorkout = false
    
    private let maxPushUpsCountInOneWorkout = 4
    static private let userDefaultsPushUpsByDaysKey = "pushupsByDaysCount"
    
    var pushupsByDayArray: [[Int]] {
        get {
            UserDefaults.standard.array(forKey: PushUpService.userDefaultsPushUpsByDaysKey) as? [[Int]] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: PushUpService.userDefaultsPushUpsByDaysKey)
            print(pushupsByDayArray.count)
        }
    }

    var pushUpsCurrentWorkoutString: String {
        let arr = pushUpsCurrentWorkout.map { String($0) }
        let str = arr.joined(separator: ", ")
        return str
    }
    
    var pushUpsByDaysString: [String] {
        var str = [String]()
        for i in pushupsByDayArray.indices {
            let arr = pushupsByDayArray[i].map { String($0) }
            let strByDay = arr.joined(separator: ", ")
            str.append(strByDay)
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
        
        if pushUpsCurrentWorkout.count == maxPushUpsCountInOneWorkout {
            endWorkout = true
        }
    }
    
    func saveDay() {
        if !pushUpsCurrentWorkout.isEmpty {
            pushupsByDayArray.append(pushUpsCurrentWorkout)
            pushUpCount = 0
            pushUpsCurrentWorkout = [Int]()
            endWorkout = false
        }
    }
    
    func clearAllData() {
        UserDefaults.standard.removeObject(forKey: PushUpService.userDefaultsPushUpsByDaysKey)
        pushupsByDayArray = [[Int]]()
    }
}
