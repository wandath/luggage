//
//  List.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation

final class List {
    var type: String
    var itemId: Int
    var travelId: UUID
    
    init(type: String, itemId: Int, travelId: UUID) {
        self.type = type
        self.itemId = itemId
        self.travelId = travelId
    }
}
