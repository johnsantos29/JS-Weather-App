//
//  WeatherData.swift
//  JS-Weather-App
//
//  Created by John Erick Santos on 9/4/2023.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Float
    let feels_like: Float
}

struct Weather: Codable, Identifiable {
    let description: String
    let id: Int
}
