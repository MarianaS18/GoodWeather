//
//  WeatherResponce.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 25/12/2021.
//

import Foundation

struct WeatherResponce: Codable {
    let name: String
    let main: Weather
}

struct Weather: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Double
}
