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
                    BoxCardView(boxName: box.name ?? "Unkown",
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
    static let boxes: [Box] = {
        let box1 = Box(context: CoreDataStack.inMemory.managedContext)
        box1.name = "Box 1"
        box1.rawTheme = 0

        let box2 = Box(context: CoreDataStack.inMemory.managedContext)
        box2.name = "Box 2"
        box2.rawTheme = 1

        let box3 = Box(context: CoreDataStack.inMemory.managedContext)
        box3.name = "Box 3"
        box3.rawTheme = 2
        
        return [box1, box2, box3]
    }()
    
    static var previews: some View {
        NavigationStack {
            BoxesView(boxes: BoxesView_Previews.boxes)
        }
    }
}
