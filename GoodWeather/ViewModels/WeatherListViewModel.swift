//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 25/12/2021.
//

import Foundation

class WeatherListViewModel {
    // MARK: - Private properties
    var weatherViewModels = [WeatherViewModel]()
    
    // MARK: - Public functions
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
            case .fahrenheit:
                toFahrenheit()
            case .celsius:
                toCelsius()
        }
    }
    
    // MARK: - Private funktions
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9 / 5) + 32
            return weatherModel
        }
    }
    
    private func toCelsius() {
        weatherViewModels = weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5 / 9
            return weatherModel
        }
    }
}
