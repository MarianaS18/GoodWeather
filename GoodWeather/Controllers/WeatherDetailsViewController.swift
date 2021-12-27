//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 26/12/2021.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    // MARK: - Public properties
    var weatherViewModel: WeatherViewModel?
    
    // MARK: - View functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func setupBindings() {
        if let weatherVM = self.weatherViewModel {
            cityNameLabel.text = weatherViewModel?.city
            currentTemperatureLabel.text = weatherVM.temperature.formatAsDegree()
        }
    }
}
