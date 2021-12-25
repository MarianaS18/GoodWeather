//
//  WeatherTableViewCell.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 25/12/2021.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // MARK: - Public functions
    func configure(_ vm: WeatherViewModel) {
        cityNameLabel.text = vm.city
        temperatureLabel.text = "\(vm.temperature.formatAsDegree())"
    }
}
