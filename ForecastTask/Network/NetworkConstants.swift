//
//  NetworkConstants.swift
//  ForecastTask
//
//  Created by  Muhammad Ismail on 19/03/2022.
//

import UIKit
import Foundation

// MARK: - Header Fields

enum HTTPHeaderField: String {
    case rapidapiHost = "x-rapidapi-host"
    case rapidapiKey = "x-rapidapi-key"
}


// MARK: - Content Type

//enum ContentType: String {
//    case json = "application/json"
//    case multipartFormDate = "multipart/form-data"
//}

enum HeaderValue: String {
    case host = "community-open-weather-map.p.rapidapi.com"
    case key = "515b839bafmsh3faa202a0fe07a6p100f94jsn4e80cd399419"
}


// MARK: - Model

//struct ServerResponse : Codable {
//    var text : String?
//    
//    enum CodingKeys: String, CodingKey {
//        case text = "Text"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        text = try values.decodeIfPresent(String.self, forKey: .text)
//    }
//}


