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
        VStack {
            Text("\(pushUpService.pushUpArrayItems)")
                .padding()
            
            Text("\(pushUpService.pushUpCount)")
                .padding()
            
            Button(action: {
                pushUpService.increment()
            }, label: {
                Text("Add pushup")
            })
            .padding()
            
            Button(action: {
                pushUpService.stopWorkout()
            }, label: {
                Text("Stop pushup")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
