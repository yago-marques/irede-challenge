//
//  ContentView.swift
//  reMind
//
//  Created by Pedro Sousa on 23/06/23.
//

import SwiftUI

struct Box: Identifiable {
    var id: UUID
    var name: String
    var numberOfTerms: Int
    var theme: BoxTheme
}

struct ContentView: View {

    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 140), spacing: 20),
        GridItem(.adaptive(minimum: 140), spacing: 20)
    ]

    @State var boxes: [Box]

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(boxes) { box in
                        BoxCardView(boxName: box.name,
                                    numberOfTerms: box.numberOfTerms,
                                    theme: box.theme)
                        .reBadge("10")
                    }
                }
                .padding(40)
            }
            .padding(-20)
            .navigationTitle("Boxes")
            .background(reBackground())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("plus button tapped!")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let boxes: [Box] = [
        Box(id: .init(), name: "Box 1", numberOfTerms: 10, theme: .mauve),
        Box(id: .init(), name: "Box 2", numberOfTerms: 20, theme: .aquamarine),
        Box(id: .init(), name: "Box 3", numberOfTerms: 30, theme: .lavender)
    ]

    static var previews: some View {
        ContentView(boxes: ContentView_Previews.boxes)
    }
}
