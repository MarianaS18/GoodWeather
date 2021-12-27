//
//  AddCityViewModel.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 25/12/2021.
//

import Foundation

class AddWeatherViewModel {
    // MARK: - Public properties
    var city: String = ""
    
    // MARK: - Public functions
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherURL = Constants.Urls.urlForWeather(city: city)
        let weatherResource = Resource<WeatherResponce>(url: weatherURL) { data in
            let weatherResponce = try? JSONDecoder().decode(WeatherResponce.self, from: data)
            return weatherResponce
        }
        Webservice().load(resourse: weatherResource) { result in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource)
                completion(vm)
            }
        }
    }
}
