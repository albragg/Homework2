//
//  ContentView.swift
//  Shared
//
//  Created by Alyssa Bragg on 1/28/22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack{
            Text("Print results of 2.1.2 Exercise 1 and Section 2.2.2 Exercises")
                .padding()
            Button("Calculate", action: {let _ = self.calcProblems()})
                .padding(.bottom)
                .padding()
            Text("Other exercises are not plotted")        }
    }
        func calcProblems(){
            calcErrorsP1(n: 15)
            calculateJL()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
