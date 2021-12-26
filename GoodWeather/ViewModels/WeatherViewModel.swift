//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 25/12/2021.
//

import Foundation
import UIKit

class WeatherViewModel {
    // MARK: - Public properties
    let weather: WeatherResponce
    var temperature: Double
    
    var city: String {
        return weather.name
    }
    
    // MARK: - Constructor
    init(weather: WeatherResponce) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    
}
