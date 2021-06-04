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
                Section(header: Text("First")) {
                    Text("Push")
                    Text("Push")
                    
                }
                Section(header: Text("Second")) {
                    Text("Push")
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "circle")
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
