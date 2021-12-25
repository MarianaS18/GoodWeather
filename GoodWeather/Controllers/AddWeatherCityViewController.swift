//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 24/12/2021.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
