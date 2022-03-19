//
//  ForecastViewModel.swift
//  ForecastTask
//
//  Created by Muhammad Ismail on 19/03/2022.
//

import Foundation

final class ForecastViewModel {
    
    // MARK: - Properties
    
    var forecastModel : Forecast?
    var currentWeatherModel : CurrentWeatherModel?
    
    
    // MARK: - API Methods
    
    func forecastDataLoad(city: String, completion: @escaping (String?) -> Void) {
        NetworkManager.shared.forecastDailyData(city: city) {
            result, errorMessage ,code in
            print("code 02 \(code) - \(errorMessage)")
            if code == 200 {
                self.forecastModel = result
                completion(nil)
            } else if errorMessage.count > 0 {
                completion(errorMessage)
            } else {
                completion("Something went wrong")
            }
//            if errorMessage.count > 0 {
//                completion(errorMessage)
//            } else {
//                self.forecastModel = result
//                completion(nil)
//            }
        }
    }
    
    func currentWeatherLoad(city: String, completion: @escaping (String?) -> Void) {
        NetworkManager.shared.currentWeatherData(city: city) {
            result, errorMessage ,code in
            print("code 01 \(code) - \(errorMessage)")
            if code == 200 {
                self.currentWeatherModel = result
                completion(nil)
            } else if errorMessage.count > 0 {
                completion(errorMessage)
            } else {
                completion("Something went wrong")
            }
//            if errorMessage.count > 0 {
//                completion(errorMessage)
//            } else {
//                self.currentWeatherModel = result
//                completion(nil)
//            }
        }
    }
}

