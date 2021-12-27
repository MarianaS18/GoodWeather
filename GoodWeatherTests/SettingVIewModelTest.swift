//
//  SettingVIewModelTest.swift
//  GoodWeatherTests
//
//  Created by Mariana Steblii on 27/12/2021.
//

import XCTest
@testable import GoodWeather

class SettingVIewModelTest: XCTestCase {

    private var settingVM: SettingViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingVM = SettingViewModel()
    }
    
    func test_should_make_sure_that_default_selected_unit_is_fahrenheit() {
        XCTAssertEqual(settingVM.selectedUnit, .celsius)
    }
    
    func test_should_return_correct_display_name_for_fahrenheit() {
        XCTAssertEqual(settingVM.selectedUnit.displayName, "Celcius")
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        settingVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }

    override class func tearDown() {
        super.tearDown()
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
