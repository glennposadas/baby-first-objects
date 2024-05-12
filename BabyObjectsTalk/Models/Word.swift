//
//  Word.swift
//  BabyObjectsTalk
//
//  Created by Glenn Posadas on 12/29/20.
//

import Foundation
import UIKit

enum Word: Int, CodingKey, CaseIterable {
    case apple = 1
    case car, ball, cat, dog, duck, boat, flower, train, shoes
    case bus, moon, sun, mouse, house, bicycle, grass, tree
    case leaf, hand, hammer, broccoli
}

extension Word {
    var icon: UIImage? {
        UIImage(named: self.stringValue)
    }
}
