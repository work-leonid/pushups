//
//  ContentView.swift
//  pushups
//
//  Created by Leonid Nazarov on 04.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pushUpService = PushUpService()
    
//    MARK: Button for adding pushups
    var addPushUpsToCurrentWorkout: some View {
        HStack {
            Button(action: {
                pushUpService.dicrementPushUps()
            }, label: {
                Image(systemName: "minus.circle.fill")
            })
            
            Text("\(pushUpService.pushUpCount)")
            
            Button(action: {
                pushUpService.incrementPushUps()
            }, label: {
                Image(systemName: "plus.circle.fill")
            })
            
            Spacer()
            
            Button(action: {
                pushUpService.addToCurrentDayWorkout()
            }, label: {
                Text("Add")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 24)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            })
            .font(.title3)
        }
        .disabled(pushUpService.endWorkout ? true : false)
        .padding()
        .frame(maxWidth: .infinity)
        .font(.largeTitle)
        .buttonStyle(BorderlessButtonStyle())
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    addPushUpsToCurrentWorkout
                    
                    if pushUpService.allPushUpsCurrentWorkout.isEmpty {
                        Text("Add You First Push Up")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                    } else {
                        HStack {
                            Text("Today pushups: ")
                            Spacer()
                            Text("\(pushUpService.convertCurrentWorkoutsToString())")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    HStack {
                        Button(action: {
                            pushUpService.saveDay()
                        }, label: {
                            Text("Save This Day")
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(BorderlessButtonStyle())
                }
                
                Section(header: Text("Push Ups by Days")) {
                    if pushUpService.allWorkouts.isEmpty {
                        Text("Empty")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(0..<pushUpService.allWorkouts.count, id:\.self) { day in
                            HStack {
                                Text("Day \(day + 1)")
                                Spacer()
                                Text("\(pushUpService.allWorkouts[day])")
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        pushUpService.clearAllData()
                    }, label: {
                        Image(systemName: "circle")
                    })
                }
            }
            .navigationBarTitle("PushUps")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
