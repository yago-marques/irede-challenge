//
//  Box.swift
//  reMind
//
//  Created by Pedro Sousa on 03/07/23.
//

import Foundation

struct Box: Identifiable {
    var id: UUID
    var name: String
    var numberOfTerms: Int
    var theme: reTheme
    var terms: [Term]
}

enum reTheme: String {
    case aquamarine
    case mauve
    case lavender
}
