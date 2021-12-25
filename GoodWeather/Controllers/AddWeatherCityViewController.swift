//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 24/12/2021.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var cityNameTextField: UITextField!
    
    // MARK: - Private properties
    private var addWeatherVM = AddWeatherViewModel()
    
    // MARK: - Public properties
    var delegate: AddWeatherDelegate?
    
    // MARK: - IBActions
    @IBAction func saveCityButtonPressed(_ sender: UIButton) {
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city) { weatherVM in
                self.delegate?.addWeatherDidSave(vm: weatherVM)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
