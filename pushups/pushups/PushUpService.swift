//
//  PushUpService.swift
//  pushups
//
//  Created by Leonid Nazarov on 04.06.2021.
//

import Foundation

class PushUpService: ObservableObject {
    @Published var pushUpCount = 0
    @Published var pushUpArray = [Int]()
    
    var pushUpArrayItems: String {
        let arr = pushUpArray.map { String($0) }
        let str = arr.joined(separator: ", ")
        return str
    }
    
    func increment() -> Int {
        pushUpCount += 1
        return pushUpCount
    }
    
    func stopWorkout() {
        pushUpArray.append(pushUpCount)
        pushUpCount = 0
    }
}
