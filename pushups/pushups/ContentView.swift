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
                .frame(minWidth: 40)
            
            Button(action: {
                pushUpService.incrementPushUps()
            }, label: {
                Image(systemName: "plus.circle.fill")
            })
            
            Spacer(minLength: 30)
            
            Button(action: {
                pushUpService.addToCurrentDayWorkout()
            }, label: {
                Text("Add")
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(pushUpService.pushUpCount > 0 ? Color.green : Color.gray)
            })
            .foregroundColor(.white)
            .clipShape(Capsule())
            .font(.title3)
            .disabled(pushUpService.pushUpCount > 0 ? false : true)
        }
        .disabled(pushUpService.endWorkout ? true : false)
        .padding(.vertical)
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
                            Text("Push Ups Left \(pushUpService.pushUpsLeft) ")
                            Spacer()
                            Text("\(pushUpService.convertCurrentWorkoutsToString())")
                                .fontWeight(.bold)
                            Button(action: {
                                pushUpService.resetWorkout()
                            }, label: {
                                Image(systemName: "xmark")
                            })
                            .buttonStyle(BorderlessButtonStyle())
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
                    .foregroundColor(pushUpService.endWorkout ? .blue : .gray)
                    .disabled(pushUpService.endWorkout ? false : true)
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
                        Label("Reset", systemImage: "trash.fill")
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
