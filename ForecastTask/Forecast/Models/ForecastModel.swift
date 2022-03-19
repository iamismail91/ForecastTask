//
//  Model.swift
//  ForecastTask
//
//  Created by Muhammad Ismail on 19/03/2022.
//

import Foundation

struct Forecast : Codable {
    let city : City?
    let cod : AnyCodableValue?
    let message : AnyCodableValue?
    let cnt : AnyCodableValue?
    let list : [List]?

    enum CodingKeys: String, CodingKey {

        case city = "city"
        case cod = "cod"
        case message = "message"
        case cnt = "cnt"
        case list = "list"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(City.self, forKey: .city)
        cod = try values.decodeIfPresent(AnyCodableValue.self, forKey: .cod)
        message = try values.decodeIfPresent(AnyCodableValue.self, forKey: .message)
        cnt = try values.decodeIfPresent(AnyCodableValue.self, forKey: .cnt)
        list = try values.decodeIfPresent([List].self, forKey: .list)
    }

}

struct City : Codable {
    let id : AnyCodableValue?
    let name : AnyCodableValue?
    let coord : Coord?
    let country : AnyCodableValue?
    let population : AnyCodableValue?
    let timezone : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case coord = "coord"
        case country = "country"
        case population = "population"
        case timezone = "timezone"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(AnyCodableValue.self, forKey: .id)
        name = try values.decodeIfPresent(AnyCodableValue.self, forKey: .name)
        coord = try values.decodeIfPresent(Coord.self, forKey: .coord)
        country = try values.decodeIfPresent(AnyCodableValue.self, forKey: .country)
        population = try values.decodeIfPresent(AnyCodableValue.self, forKey: .population)
        timezone = try values.decodeIfPresent(AnyCodableValue.self, forKey: .timezone)
    }

}

struct Coord : Codable {
    let lon : AnyCodableValue?
    let lat : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case lon = "lon"
        case lat = "lat"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lon = try values.decodeIfPresent(AnyCodableValue.self, forKey: .lon)
        lat = try values.decodeIfPresent(AnyCodableValue.self, forKey: .lat)
    }

}

struct Feels_like : Codable {
    let day : AnyCodableValue?
    let night : AnyCodableValue?
    let eve : AnyCodableValue?
    let morn : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decodeIfPresent(AnyCodableValue.self, forKey: .day)
        night = try values.decodeIfPresent(AnyCodableValue.self, forKey: .night)
        eve = try values.decodeIfPresent(AnyCodableValue.self, forKey: .eve)
        morn = try values.decodeIfPresent(AnyCodableValue.self, forKey: .morn)
    }

}

struct List : Codable {
    let dt : AnyCodableValue?
    let sunrise : AnyCodableValue?
    let sunset : AnyCodableValue?
    let temp : Temp?
    let feels_like : Feels_like?
    let pressure : AnyCodableValue?
    let humidity : AnyCodableValue?
    let weather : [Weather]?
    let speed : AnyCodableValue?
    let deg : AnyCodableValue?
    let gust : AnyCodableValue?
    let clouds : AnyCodableValue?
    let pop : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case feels_like = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case weather = "weather"
        case speed = "speed"
        case deg = "deg"
        case gust = "gust"
        case clouds = "clouds"
        case pop = "pop"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decodeIfPresent(AnyCodableValue.self, forKey: .dt)
        sunrise = try values.decodeIfPresent(AnyCodableValue.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(AnyCodableValue.self, forKey: .sunset)
        temp = try values.decodeIfPresent(Temp.self, forKey: .temp)
        feels_like = try values.decodeIfPresent(Feels_like.self, forKey: .feels_like)
        pressure = try values.decodeIfPresent(AnyCodableValue.self, forKey: .pressure)
        humidity = try values.decodeIfPresent(AnyCodableValue.self, forKey: .humidity)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
        speed = try values.decodeIfPresent(AnyCodableValue.self, forKey: .speed)
        deg = try values.decodeIfPresent(AnyCodableValue.self, forKey: .deg)
        gust = try values.decodeIfPresent(AnyCodableValue.self, forKey: .gust)
        clouds = try values.decodeIfPresent(AnyCodableValue.self, forKey: .clouds)
        pop = try values.decodeIfPresent(AnyCodableValue.self, forKey: .pop)
    }

}

struct Temp : Codable {
    let day : AnyCodableValue?
    let min : AnyCodableValue?
    let max : AnyCodableValue?
    let night : AnyCodableValue?
    let eve : AnyCodableValue?
    let morn : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case min = "min"
        case max = "max"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decodeIfPresent(AnyCodableValue.self, forKey: .day)
        min = try values.decodeIfPresent(AnyCodableValue.self, forKey: .min)
        max = try values.decodeIfPresent(AnyCodableValue.self, forKey: .max)
        night = try values.decodeIfPresent(AnyCodableValue.self, forKey: .night)
        eve = try values.decodeIfPresent(AnyCodableValue.self, forKey: .eve)
        morn = try values.decodeIfPresent(AnyCodableValue.self, forKey: .morn)
    }

}

struct Weather : Codable {
    let id : AnyCodableValue?
    let main : AnyCodableValue?
    let description : AnyCodableValue?
    let icon : AnyCodableValue?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(AnyCodableValue.self, forKey: .id)
        main = try values.decodeIfPresent(AnyCodableValue.self, forKey: .main)
        description = try values.decodeIfPresent(AnyCodableValue.self, forKey: .description)
        icon = try values.decodeIfPresent(AnyCodableValue.self, forKey: .icon)
    }

}

