//
//  ContentView.swift
//  reMind
//
//  Created by Pedro Sousa on 23/06/23.
//

import SwiftUI

struct BoxesView: View {
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 140), spacing: 20),
        GridItem(.adaptive(minimum: 140), spacing: 20)
    ]
    
    @State var boxes: [Box]
    
    var body: some View {
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

struct BoxesView_Previews: PreviewProvider {
    static let boxes: [Box] = [
        Box(id: .init(), name: "Box 1", numberOfTerms: 10, theme: .mauve, terms: []),
        Box(id: .init(), name: "Box 2", numberOfTerms: 20, theme: .aquamarine, terms: []),
        Box(id: .init(), name: "Box 3", numberOfTerms: 30, theme: .lavender, terms: [])
    ]
    
    static var previews: some View {
        NavigationStack {
            BoxesView(boxes: BoxesView_Previews.boxes)
        }
    }
}
