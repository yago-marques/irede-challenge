//
//  ContentView.swift
//  reMind
//
//  Created by Pedro Sousa on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Tap!") {
                print("Tapped...")
            }
            .buttonStyle(.borderedProminent)
            .foregroundColor(.black)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
