//
//  Weather.swift
//  Luggage
//
//  Created by Anya SCHOUVEY on 13/06/2023.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherModel {
    var meteo: WeatherCondition // enum qui indique le temps (ex: nuageux, pluvieux, etc)
    var location: CLLocation
    var travelId: UUID
    
    init(meteo: WeatherCondition, travelId: UUID, location: CLLocation) {
        self.meteo = meteo
        self.travelId = travelId
        self.location = location
    }
    
    static func getQueryFor(_ location: CLLocation) async {
    let wService = WeatherService()
        try? await wService.weather(for: location).dailyForecast
    }
}
