//
//  SwipperView.swift
//  reMind
//
//  Created by Pedro Sousa on 03/07/23.
//

import SwiftUI

struct SwipperView: View {
    @Environment(\.presentationMode) var presententationMode
    @Environment(\.colorScheme) var scheme
    @State var review: SwipeReview
    @State private var direction: SwipperDirection = .none
    @Binding var paths: NavigationPath
    @State var reviewedTerms = [Term]()

    var body: some View {
        VStack {
            SwipperLabel(direction: $direction)
                .padding()

            Spacer()

            ZStack {
                ForEach(review.termsToReview, id: \.self) { term in
                    SwipperCard(direction: $direction, theme: term.theme, handle: goToNext,
                        frontContent: {
                            Text(term.value ?? "Empty")
                                .foregroundStyle(.black)
                        }, backContent: {
                            Text(term.meaning ?? "Empty")
                                .foregroundStyle(.black)
                        })
                }
            }
            

            Spacer()

            Button(action: {
                paths.append(SwipperReportInfo(
                    review: review,
                    reviewedTerms: reviewedTerms
                ))
            }, label: {
                Text("Finish Review")
                    .foregroundStyle(scheme == .dark ? .black : .white)
                    .frame(maxWidth: .infinity, alignment: .center)
            })
            .buttonStyle(reButtonStyle())
            .padding(.bottom, 30)
                
        }
        .navigationDestination(for: SwipperReportInfo.self) { info in
            SwipperReportView(
                paths: $paths,
                info: info
            )
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(reBackground())
        .navigationTitle("\(review.termsToReview.count) terms left")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
    
    func goToNext() {
        guard let term = review.termsToReview.last else { return }
        
        if direction == .left {
            review.termsToReview.removeLast()
        } else if direction == .right {
            term.lastReview = Date()
            CoreDataStack.shared.saveContext()
            review.termsToReview.removeLast()
        }
        
        reviewedTerms.append(term)
    }
}
