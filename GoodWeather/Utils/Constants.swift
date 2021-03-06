//
//  Constants.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 25/12/2021.
//

import Foundation

struct Constants {
    // MARK: - URL
    struct Urls {
        static func urlForWeather(city: String) -> URL {
            // get the defaults setting for temperature
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=b6bc12b0f98d15ed22b1b3ad8cc7a947&units=\(unit)")!
        }
    }
    
}
