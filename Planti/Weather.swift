//
//  Weather.swift
//  Vision+ML Example
//
//  Created by Matthew Memme on 2021-01-16.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation

struct Weather: Codable {
  var weather: [WeatherData]
}

struct WeatherData: Codable {
    var main: String
    var description: String
}

struct TemperatureData: Codable {
    var main: Temperature
}

struct Temperature: Codable {
    var temp: Double
}
