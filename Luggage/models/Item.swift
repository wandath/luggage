//
//  Item.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation

final class Item {
    var luggageItem: String
    var quantity: Int
    
    init(luggageItem: String, quantity: Int) {
        self.luggageItem = luggageItem
        self.quantity = quantity
    }
}
