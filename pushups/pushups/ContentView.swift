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
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .font(.largeTitle)
                    .buttonStyle(BorderlessButtonStyle())
                    
                    Text("Today pushups: 0")
                    
                    HStack {
                        Button(action: {}, label: {
                            Text("Add to Workout")
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Text("Save This Day")
                        })
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                
                
                Section(header: Text("Second")) {
                    Text("Push")
                }
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {}, label: {
                        Text("Add button")
                    })
                    Button(action: {}, label: {
                        Text("Add button")
                    })
                }
            }
            .navigationBarTitle("PushUps")
        }
        //        VStack {
        //            Group {
        //                Text("By day: \(pushUpService.pushUpsByDaysString)")
        //                    .padding()
        //
        //                Text("Current: \(pushUpService.pushUpsCurrentWorkoutString)")
        //                    .padding()
        //            }
        //
        //            Text("\(pushUpService.pushUpCount)")
        //                .padding()
        //
        //            Button(action: {
        //                pushUpService.increment()
        //            }, label: {
        //                Text("Add pushup")
        //            })
        //            .padding()
        //
        //            Button(action: {
        //                pushUpService.addToCurrentDayWorkout()
        //            }, label: {
        //                Text("Add to workout")
        //            })
        //            .padding()
        //
        //            Button(action: {
        //                pushUpService.saveDay()
        //            }, label: {
        //                Text("Save day")
        //            })
        //        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
