//
//  WeatherView.swift
//  Luggage
//
//  Created by chameseddine yahia on 18/6/2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
      var body: some View {
          HStack(alignment: .top, spacing: 12, content: {
             
              Text(weather.name)
          })
          
          
      }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
