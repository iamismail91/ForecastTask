//
//  NetworkLogger.swift
//  ForecastTask
//
//  Created by  Muhammad Ismail on 19/03/2022.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
    
    // MARK: - Properties
    
    let queue = DispatchQueue(label: "com.forecastTask.store.networklogger")
    
    
    // MARK: - Private Methods
    
    func requestDidFinish(_ request: Request) {
        // debugPrint(request.description)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        /* guard let data = response.data else {
         return
         }
         if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
         debugPrint(json)
         } */
    }
    
}

