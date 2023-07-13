//
//  Term.swift
//  reMind
//
//  Created by Pedro Sousa on 03/07/23.
//

import SwiftUI

extension Term {
    var srs: SpacedRepetitionSystem {
        let rawSRS = Int(rawSRS)
        return SpacedRepetitionSystem(rawValue: rawSRS) ?? SpacedRepetitionSystem.first
    }

    var theme: reTheme {
        let rawTheme = Int(self.rawTheme)
        return reTheme(rawValue: Int(self.rawTheme)) ?? reTheme.lavender
    }
}

enum SpacedRepetitionSystem: Int {
    case none = 0
    case first = 1
    case second = 2
    case third = 3
    case fourth = 5
    case fifth = 8
    case sixth = 13
    case seventh = 21
}
