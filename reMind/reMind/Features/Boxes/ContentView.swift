//
//  ContentView.swift
//  reMind
//
//  Created by Pedro Sousa on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BoxCardView(boxName: "Box",
                    numberOfTerms: 10,
                    theme: .mauve)
            .reBadge("10")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
