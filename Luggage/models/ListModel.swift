//
//  List.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation

final class ListModel {
    var type: String
    var item: ItemModel
    var travelId: UUID
    
    init(type: String, item: ItemModel, travelId: UUID) {
        self.type = type
        self.item = item
        self.travelId = travelId
    }
}
