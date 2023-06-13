//
//  Weather.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation
import WeatherKit

final class Weather {
    var meteo: WeatherCondition
    var travelId: UUID
    
    init(meteo: WeatherCondition, travelId: UUID) {
        self.meteo = meteo
        self.travelId = travelId
    }
}
