//
//  NetworkManager.swift
//  ForecastTask
//
//  Created by  Muhammad Ismail on 19/03/2022.
//

import UIKit
import Alamofire
import Foundation

class NetworkManager: SessionDelegate {
    
    // MARK: - Properties
    
    static let shared = NetworkManager()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 90
        configuration.timeoutIntervalForResource = 90
        configuration.urlCache = nil
        
        let networkLogger = NetworkLogger()
        let interceptor = NetworkRequestInterceptor()
        
        var trustedPolicy: ServerTrustManager?
        return Session(
            configuration: configuration,
            interceptor: interceptor,
            serverTrustManager: trustedPolicy,
            eventMonitors: [networkLogger])
    }()
    
    
    // MARK: - Private Methods
    
    func performRequest<T:Decodable>(route: NetworkRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (T?, String, Int)->Void) ->Void {
        sessionManager.request(route).responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
            debugPrint(response)
            
            let code = response.response?.statusCode ?? 0
            switch response.result {
            case .success(let result):
                // debugPrint(result)
                completion(result, "", code)
                
            case .failure(let error):
                var message = ""
                switch error {
                case .sessionTaskFailed(URLError.timedOut):
                    message = "Request timeout!"
                case .sessionTaskFailed(URLError.notConnectedToInternet), .sessionTaskFailed(URLError.networkConnectionLost):
                    message = "The Internet connection appears to be offline."
                default:
                    debugPrint("Other error!") // -1200
                    if code == 400 || code > 499 {
                        message = ERROR_MSG_UNEXPECTED_ERROR
                    } else {
                        message = error.localizedDescription
                    }
                }
                
                debugPrint(error)
                debugPrint(response.debugDescription)
                debugPrint(error.responseCode as Any)
                debugPrint(error.localizedDescription)
                debugPrint(response.response?.statusCode as Any)
                completion(nil, message, code)
            }
        }
    }
    
    
    // MARK: - Public Methods
    
    func currentWeatherData(city: String,_ completion: @escaping (CurrentWeatherModel?, String, Int) -> Void) {
        performRequest(route: NetworkRouter.currentWeather(city), completion: completion)
    }
    
    func forecastDailyData(city: String,_ completion: @escaping (Forecast?, String, Int) -> Void) {
        performRequest(route: NetworkRouter.dailyForecast(city), completion: completion)
    }
}

