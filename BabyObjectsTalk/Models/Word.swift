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
}

extension Word {
    var icon: UIImage? {
        UIImage(named: self.stringValue)
    }
}
