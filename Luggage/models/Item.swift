//
//  Item.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation

final class Item {
    var object: String
    var quantity: Int
    
    init(object: String, quantity: Int) {
        self.object = object
        self.quantity = quantity
    }
}
