//
//  ContentView.swift
//  reMind
//
//  Created by Pedro Sousa on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .background(reBackground())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
