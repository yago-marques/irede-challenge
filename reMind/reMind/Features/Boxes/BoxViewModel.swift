//
//  BoxViewModel.swift
//  reMind
//
//  Created by Pedro Sousa on 17/07/23.
//

import Foundation

final class BoxViewModel: ObservableObject {
    @Published var boxes: [Box] = []

    init() {
        self.boxes = Box.all()
    }
    
    func saveBox(_ box: Box) {
        CoreDataStack.shared.saveContext()
        boxes.append(box)
    }
    
    func update() {
        boxes = Box.all()
    }
}
