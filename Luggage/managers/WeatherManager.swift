//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Stephanie Diep on 2021-11-30.
//


import Foundation


enum FetchDataError: Error {
    case dataFetchError
}

class WeatherManager {
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
 
    
    func getCurrentWeather(city : String) async throws -> ResponseBody {
        // Replace YOUR_API_KEY in the link below with your own
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=016eda15433846fd510158266f1e0f9c&units=metric") else {
               fatalError("Missing URL")
           }

           let urlRequest = URLRequest(url: url)

           do {
               let (data, response) = try await URLSession.shared.data(for: urlRequest)
               
               guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                   throw FetchDataError.dataFetchError
               }
               
               let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
               
               return decodedData
           } catch {
               throw error
           }
    }
    
    
    
    func loadArrayFromJSON<T: Decodable>(fileName: String) throws -> [T] {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw NSError(domain: NSCocoaErrorDomain, code: NSFileNoSuchFileError, userInfo: nil)
        }
        
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        guard let jsonArray = jsonData?["vetements"] as? [[String: Any]] else {
            throw NSError(domain: NSCocoaErrorDomain, code: NSFileReadCorruptFileError, userInfo: nil)
        }
        
        let array = try decoder.decode([T].self, from: JSONSerialization.data(withJSONObject: jsonArray, options: []))
        
        return array
    }
    
    
    func getTemperatureForTravel(transport: String, purpose: String , city : String) async throws -> [LugguageModal] {
         
        
        
        do {
            let weather : ResponseBody = try await getCurrentWeather(city: city)
            print(weather.main.feels_like)
            let clothingArray: [LugguageModal] = try loadArrayFromJSON(fileName: "LuggageData")
            
            // Filter the clothingArray based on purpose, transport, and temperature criteria
            let filteredArray = clothingArray.filter { item in
                let temperature = item.température

                // Check if the item's temperature value is within temperature ± 5
                let itemTemperature = Int(weather.main.feels_like)
                let temperatureString: String
                         if itemTemperature >= 25 {
                             temperatureString = "hot"
                         } else if itemTemperature >= 18 && itemTemperature <= 24 {
                             temperatureString = "warm"
                         } else {
                             temperatureString = "cold"
                         }
            
                print(item , temperatureString , transport , purpose)
                return  temperature.lowercased() == temperatureString.lowercased() && item.outilVoyage.lowercased() == purpose.lowercased() || item.typeVoyage.lowercased() == transport.lowercased()         }

            return filteredArray
        }
        
        catch {
            print("Error loading array from JSON: \(error)")
            throw error
        }
       
     }
    
    
    
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

