//
//  Shape.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation

enum Padding: CGFloat {
    case Small = 12
    case Regular = 16
    case Large = 32
    case XLarge = 64
    
    func size() -> CGFloat {
        return CGFloat(self.rawValue)
    }
}

public struct Shape {
    let padding: Padding = .Regular
}
