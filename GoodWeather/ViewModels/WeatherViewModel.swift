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
    
    var city: String {
        return weather.name
    }
    
    var temperature: Double {
        return weather.main.temp
    }
    
    // MARK: - Constructor
    init(weather: WeatherResponce) {
        self.weather = weather
    }
    
    
}
