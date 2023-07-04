//
//  Term.swift
//  reMind
//
//  Created by Pedro Sousa on 03/07/23.
//

import Foundation

struct Term: Identifiable {
    var id: UUID
    var boxID: UUID
    var term: String
    var meaning: String
    var theme: reTheme
    var creationDate: Date
    var lastReview: Date
    var srs: SpacedRepetitionSystem
}

enum SpacedRepetitionSystem: Int {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 5
    case fifth = 8
    case sixth = 13
    case seventh = 21
}
