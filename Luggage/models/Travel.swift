//
//  Travel.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation

final class Travel: Identifiable{
    let travelId: UUID = UUID()
    var destination: String
    var type: String
    var departureDate: Date
    var arrivalDate: Date
    
    init(destination: String, type: String, departureDate: Date, arrivalDate: Date) {
        self.destination = destination
        self.type = type
        self.departureDate = departureDate
        self.arrivalDate = arrivalDate
    }
}
