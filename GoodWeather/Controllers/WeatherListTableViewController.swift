//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 24/12/2021.
//

import UIKit

class WeatherListViewController: UITableViewController {
    // MARK: - View funtions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell else {
            fatalError("Weather cell is not found")
        }
        cell.cityNameLabel.text = "Solbjerg"
        cell.temperatureLabel.text = "-2°"
        return cell
    }
}
