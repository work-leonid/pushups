//
//  ContentView.swift
//  pushups
//
//  Created by Leonid Nazarov on 04.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pushUpService = PushUpService()
    
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
                    
                    if pushUpService.pushUpsCurrentWorkoutString.isEmpty {
                        Text("Add You First Push Up")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                    } else {
                        HStack {
                            Text("Today pushups: ")
                            Spacer()
                            Text("\(pushUpService.pushUpsCurrentWorkoutString)")
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
                    if pushUpService.pushUpsByDaysString.isEmpty {
                        Text("Empty")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(0..<pushUpService.pushUpsByDaysString.count, id:\.self) { day in
                            HStack {
                                Text("Day \(day + 1)")
                                Spacer()
                                Text("\(pushUpService.pushUpsByDaysString[day])")
                            }
                        }
                    }
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
