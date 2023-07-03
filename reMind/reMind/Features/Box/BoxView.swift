//
//  BoxView.swift
//  reMind
//
//  Created by Pedro Sousa on 03/07/23.
//

import SwiftUI

struct BoxView: View {
    @State var boxName: String
    @State var terms: [String]
    @State var numberOfPendingTerms: Int

    @State private var searchText: String = ""

    private var filteredTerms: [String] {
        if searchText.isEmpty {
            return terms
        } else {
            return terms.filter { $0.contains(searchText) }
        }
    }
    
    var body: some View {
        List {
                TodaysCardsView(numberOfPendingCards: numberOfPendingTerms,
                                theme: .mauve)
            Section {
                ForEach(filteredTerms, id: \.self) { term in
                    Text(term)
                        .padding(.vertical, 8)
                        .fontWeight(.bold)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                print("delete")
                            } label: {
                                Image(systemName: "trash")
                            }

                        }
                }
            } header: {
                Text("All Cards")
                    .textCase(.none)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Palette.label.render)
                    .padding(.leading, -16)
                    .padding(.bottom, 16)
            }

        }
        .scrollContentBackground(.hidden)
        .background(reBackground())
        .navigationTitle(boxName)
        .searchable(text: $searchText, prompt: "")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    print("edit")
                } label: {
                    Image(systemName: "square.and.pencil")
                }

                Button {
                    print("add")
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
}

struct BoxView_Previews: PreviewProvider {
    static let terms: [String] = (0...9).map { "Term \($0)" }
    static var previews: some View {
        NavigationStack {
            BoxView(boxName: "Programming",
                    terms: BoxView_Previews.terms,
                    numberOfPendingTerms: 10)
        }
    }
}
