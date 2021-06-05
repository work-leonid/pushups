//
//  ContentView.swift
//  pushups
//
//  Created by Leonid Nazarov on 04.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pushUpService = PushUpService()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
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
                    
                    Text("Today pushups: \(pushUpService.pushUpsCurrentWorkoutString)")
                    
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
                
                
                Section(header: Text("Workout Days")) {
                    if pushUpService.pushUpsByDaysString.isEmpty {
                        Text("Empy")
                    } else {
                        ForEach(0..<pushUpService.pushUpsByDaysString.count, id:\.self) { day in
                            Text("\(pushUpService.pushUpsByDaysString[day])")
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
