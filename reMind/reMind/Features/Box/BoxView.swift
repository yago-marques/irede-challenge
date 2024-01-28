//
//  BoxView.swift
//  reMind
//
//  Created by Pedro Sousa on 03/07/23.
//

import SwiftUI

struct BoxView: View {
    @State var box: Box
    @Binding var paths: NavigationPath
    @State var todaysCardInfo: TodaysCardsInfo
    @State private var searchText: String = ""
    @State private var isEditPresented = false
    @State private var isTermEditorPresented = false

    private var filteredTerms: [Term] {
        let termsSet = box.terms as? Set<Term> ?? []
        let terms = Array(termsSet).sorted { lhs, rhs in
            (lhs.value ?? "") < (rhs.value ?? "")
        }
        
        if searchText.isEmpty {
            return terms
        } else {
            return terms.filter { ($0.value ?? "").contains(searchText) }
        }
    }
    
    var body: some View {
        List {
            TodaysCardsView(info: todaysCardInfo) {
                paths.append(
                    SwipeReview(termsToReview: box.termsToReview)
                )
            }
            Section {
                ForEach(filteredTerms, id: \.self) { term in
                    Text(term.value ?? "Unknown")
                        .padding(.vertical, 8)
                        .fontWeight(.bold)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                term.destroy()
                                CoreDataStack.shared.saveContext()
                                todaysCardInfo.cardsToReview = box.termsToReview.count
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
        .sheet(isPresented: $isEditPresented) {
            BoxEditorView(
                name: box.name,
                keywords: box.keywords ?? "",
                description: box.boxDescription ?? "",
                theme: Int(box.rawTheme),
                mode: .edit,
                createHandler: nil,
                editHandler: editBox
            )
        }
        .sheet(isPresented: $isTermEditorPresented) {
            TermEditorView(
                term: "",
                meaning: "",
                box: box,
                addTermHandler: addTerm
            )
        }
        .navigationDestination(for: SwipeReview.self) { review in
            SwipperView(review: review, paths: $paths)
        }
        .scrollContentBackground(.hidden)
        .background(reBackground())
        .navigationTitle(box.name)
        .searchable(text: $searchText, prompt: "")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    isEditPresented = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }

                Button {
                    isTermEditorPresented = true
                } label: {
                    Image(systemName: "plus")
                }

            }
        }
    }
        
    func editBox(_ editedBox: BoxInfo) {
        box.name = editedBox.name
        box.keywords = editedBox.keywords
        box.rawTheme = Int16(editedBox.theme)
        box.boxDescription = editedBox.description
        CoreDataStack.shared.saveContext()
        todaysCardInfo.theme = box.theme
    }
    
    func addTerm(_ term: Term) {
        box.addToTerms(term)
        CoreDataStack.shared.saveContext()
        todaysCardInfo.cardsToReview = box.termsToReview.count
    }
}
