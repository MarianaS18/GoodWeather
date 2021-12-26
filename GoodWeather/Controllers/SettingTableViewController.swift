//
//  SettingTableViewController.swift
//  GoodWeather
//
//  Created by Mariana Steblii on 25/12/2021.
//

import UIKit

protocol SettingDelegate {
    func settingsDone(vm: SettingViewModel)
}

class SettingTableViewController: UITableViewController {
    // MARK: - Private properties
    private var settingVM = SettingViewModel()
    
    // MARK: - Public properties
    var delegate: SettingDelegate?
    
    // MARK: - View funtions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingVM.units[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingTableViewCell else {
            fatalError("SettingCell not found")
        }
        cell.unitNameLabel.text = settingsItem.displayName
        
        if settingsItem == settingVM.selectedUnit {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingVM.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    // MARK: - IBActions
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let delegate = self.delegate {
            delegate.settingsDone(vm: settingVM)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
