//
//  CurrentWeatherModel.swift
//  ForecastTask
//
//  Created by Muhammad Ismail on 19/03/2022.
//

import Foundation
struct CurrentWeatherModel : Codable {
    let coord : Coord?
    let weather : [Weather]?
    let base : AnyCodableValue?
    let main : Main?
    let visibility : AnyCodableValue?
    let wind : Wind?
    let clouds : Clouds?
    let dt : AnyCodableValue?
    let sys : Sys?
    let timezone : AnyCodableValue?
    let id : AnyCodableValue?
    let name : AnyCodableValue?
    let cod : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case coord = "coord"
        case weather = "weather"
        case base = "base"
        case main = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case dt = "dt"
        case sys = "sys"
        case timezone = "timezone"
        case id = "id"
        case name = "name"
        case cod = "cod"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        base = try values.decodeIfPresent(AnyCodableValue.self, forKey: .base)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        visibility = try values.decodeIfPresent(AnyCodableValue.self, forKey: .visibility)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        clouds = try values.decodeIfPresent(Clouds.self, forKey: .clouds)
        dt = try values.decodeIfPresent(AnyCodableValue.self, forKey: .dt)
        sys = try values.decodeIfPresent(Sys.self, forKey: .sys)
        timezone = try values.decodeIfPresent(AnyCodableValue.self, forKey: .timezone)
        id = try values.decodeIfPresent(AnyCodableValue.self, forKey: .id)
        name = try values.decodeIfPresent(AnyCodableValue.self, forKey: .name)
        cod = try values.decodeIfPresent(AnyCodableValue.self, forKey: .cod)
    }

}

struct Clouds : Codable {
    let all : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case all = "all"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        all = try values.decodeIfPresent(AnyCodableValue.self, forKey: .all)
    }

}

struct Main : Codable {
    let temp : AnyCodableValue?
    let feels_like : AnyCodableValue?
    let temp_min : AnyCodableValue?
    let temp_max : AnyCodableValue?
    let pressure : AnyCodableValue?
    let humidity : AnyCodableValue?
    let sea_level : AnyCodableValue?
    let grnd_level : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case temp = "temp"
        case feels_like = "feels_like"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
        case sea_level = "sea_level"
        case grnd_level = "grnd_level"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp = try values.decodeIfPresent(AnyCodableValue.self, forKey: .temp)
        feels_like = try values.decodeIfPresent(AnyCodableValue.self, forKey: .feels_like)
        temp_min = try values.decodeIfPresent(AnyCodableValue.self, forKey: .temp_min)
        temp_max = try values.decodeIfPresent(AnyCodableValue.self, forKey: .temp_max)
        pressure = try values.decodeIfPresent(AnyCodableValue.self, forKey: .pressure)
        humidity = try values.decodeIfPresent(AnyCodableValue.self, forKey: .humidity)
        sea_level = try values.decodeIfPresent(AnyCodableValue.self, forKey: .sea_level)
        grnd_level = try values.decodeIfPresent(AnyCodableValue.self, forKey: .grnd_level)
    }

}

struct Sys : Codable {
    let type : AnyCodableValue?
    let id : AnyCodableValue?
    let country : AnyCodableValue?
    let sunrise : AnyCodableValue?
    let sunset : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(AnyCodableValue.self, forKey: .type)
        id = try values.decodeIfPresent(AnyCodableValue.self, forKey: .id)
        country = try values.decodeIfPresent(AnyCodableValue.self, forKey: .country)
        sunrise = try values.decodeIfPresent(AnyCodableValue.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(AnyCodableValue.self, forKey: .sunset)
    }

}

struct Wind : Codable {
    let speed : AnyCodableValue?
    let deg : AnyCodableValue?
    let gust : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case speed = "speed"
        case deg = "deg"
        case gust = "gust"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        speed = try values.decodeIfPresent(AnyCodableValue.self, forKey: .speed)
        deg = try values.decodeIfPresent(AnyCodableValue.self, forKey: .deg)
        gust = try values.decodeIfPresent(AnyCodableValue.self, forKey: .gust)
    }

}
