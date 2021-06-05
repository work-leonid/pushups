//
//  PushUpService.swift
//  pushups
//
//  Created by Leonid Nazarov on 04.06.2021.
//

import Foundation

class PushUpService: ObservableObject {
    @Published var pushUpCount = 0
    @Published var allPushUpsCurrentWorkout = [Int]()
    @Published var allWorkouts = [String]()
    @Published var endWorkout = false
    @Published var pushUpsLeft = maxPushUpsCurrentWorkout
    
    static private let maxPushUpsCurrentWorkout = 4
    static private let userDefaultsPushUpsByDaysKey = "pushupsByDaysCount"
    
    var allWorkoutsUserDefaults: [[Int]] {
        get {
            UserDefaults.standard.array(forKey: PushUpService.userDefaultsPushUpsByDaysKey) as? [[Int]] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: PushUpService.userDefaultsPushUpsByDaysKey)
        }
    }
    
    func convertCurrentWorkoutsToString() -> String {
        allPushUpsCurrentWorkout.map { String($0) }.joined(separator: ", ")
    }
    
    func convertAllWorkoutsToString() {
        for i in allWorkoutsUserDefaults.indices {
            let arr = allWorkoutsUserDefaults[i].map { String($0) }.joined(separator: ", ")
            allWorkouts.append(arr)
        }
    }
    
    func incrementPushUps() -> Int {
        pushUpCount += 1
        return pushUpCount
    }
    
    func dicrementPushUps() -> Int {
        if pushUpCount > 0 {
            pushUpCount -= 1
        }
        return pushUpCount
    }
    
    func addToCurrentDayWorkout() {
        if pushUpCount > 0 {
            allPushUpsCurrentWorkout.append(pushUpCount)
            pushUpCount = 0
        }
        
        pushUpsLeft -= 1
        
        if allPushUpsCurrentWorkout.count == PushUpService.maxPushUpsCurrentWorkout {
            endWorkout = true
        }
    }
    
    func saveDay() {
        if !(allPushUpsCurrentWorkout.count < PushUpService.maxPushUpsCurrentWorkout)  {
            let currentWorkoutsString = convertCurrentWorkoutsToString()
            allWorkouts.append(currentWorkoutsString)
            resetWorkout()
        }
    }
    
    func resetWorkout() {
        pushUpCount = 0
        pushUpsLeft = PushUpService.maxPushUpsCurrentWorkout
        allPushUpsCurrentWorkout = [Int]()
        endWorkout = false
    }
    
    func clearAllData() {
        UserDefaults.standard.removeObject(forKey: PushUpService.userDefaultsPushUpsByDaysKey)
        allWorkouts = [String]()
    }
}
