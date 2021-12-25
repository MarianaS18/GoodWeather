//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 24/12/2021.
//

import UIKit

class WeatherListViewController: UITableViewController {
    // MARK: - Private properties
    private var weatherListVM = WeatherListViewModel()
    
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
        return weatherListVM.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell else {
            fatalError("Weather cell is not found")
        }
        let weatherVM = weatherListVM.modelAt(indexPath.row)
        cell.configure(weatherVM)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAddWeatherVC" {
            prepareSegueForAddWeatherVC(segue: segue)
        }
    }
    
    // MARK: - Public functions
    func prepareSegueForAddWeatherVC(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        addWeatherCityVC.delegate = self
    }
}

// MARK: - AddWeatherDelegate
extension WeatherListViewController: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListVM.addWeatherViewModel(vm)
        tableView.reloadData()
    }
}
