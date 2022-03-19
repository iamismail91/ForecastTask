//
//  NetworkRouter.swift
//  ForecastTask
//
//  Created by Muhammad Ismail on 19/03/2022.
//

import Alamofire
import Foundation

enum NetworkRouter: URLRequestConvertible {
    
    
    case currentWeather(_ city: String)
    case dailyForecast(_ city: String)
    
    // MARK: - Path

    var baseURL: String {
        return "https://community-open-weather-map.p.rapidapi.com/"
    }
    
    
    // MARK: - Endpoints
    
    var path: String {
        switch self {
        case .currentWeather: return "weather"
        case .dailyForecast: return "forecast/daily"
        }
    }
    
    
    // MARK: - HTTPMethod
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    
    // MARK: - Parameters
    
    var parameters: [String: Any] {
        switch self {
           
        case .currentWeather(let city):
            let jsonParameters = ["q": city] as [String: Any]
            return (jsonParameters as [String: Any])
        case .dailyForecast(let city):
            let jsonParameters = ["q": city,
                                  "cnt":"7"] as [String: Any]
            return (jsonParameters as [String: Any])
        }
    }
    
    
    // MARK: - Headers
    
    var allHeaders: HTTPHeaders {
        var headers: [HTTPHeader] = []
        
        switch self {
        default:
            headers.append(HTTPHeader(name: HTTPHeaderField.rapidapiHost.rawValue, value: HeaderValue.host.rawValue))
            headers.append(HTTPHeader(name: HTTPHeaderField.rapidapiKey.rawValue, value: HeaderValue.key.rawValue))
        }
        
        return HTTPHeaders(headers)
    }
    
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url: URL
        url = try baseURL.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.timeoutInterval = TimeInterval(10*1000)
        request.httpMethod = method.rawValue
        request.headers = allHeaders
        
        if method == .get {
            request = try URLEncoding.default.encode(request, with: parameters)
        } else if method == .post || method == .patch {
            request = try JSONEncoding.default.encode(request, with: parameters)
        }
        return request
    }
}

