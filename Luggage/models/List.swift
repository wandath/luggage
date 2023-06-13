//
//  List.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation

final class List {
    var type: String
    var item: Item
    var travelId: UUID
    
    init(type: String, item: Item, travelId: UUID) {
        self.type = type
        self.item = item
        self.travelId = travelId
    }
}
