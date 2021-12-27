//
//  WeatherListViewModelTest.swift
//  GoodWeatherTests
//
//  Created by Mariana Steblii on 27/12/2021.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTest: XCTestCase {

    private var weatherListVM: WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        weatherListVM = WeatherListViewModel()
        weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponce(name: "Solbjerg", main: Weather(temp: -2, temp_min: -10, temp_max: 25, humidity: 55))))
        weatherListVM.addWeatherViewModel(WeatherViewModel(weather: WeatherResponce(name: "Aarhus", main: Weather(temp: -4, temp_min: -15, temp_max: 27, humidity: 85))))
    }
    
    func test_should_be_able_to_convert_to_fehrenhait_successufully() {
        let temp = [28.4, 24.8]
        weatherListVM.updateUnit(to: .fahrenheit)
        for (index, vm) in weatherListVM.weatherViewModels.enumerated() {
            XCTAssertEqual(vm.temperature, temp[index])
        }
    }

}
