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
    
    var minTemperature: Double {
        return weather.main.temp_min
    }
    
    var maxTemperature: Double {
        return weather.main.temp_max
    }
    
    // MARK: - Constructor
    init(weather: WeatherResponce) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
}


// Type Eraser
class Dynamic<T>: Decodable where T: Decodable {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
}
