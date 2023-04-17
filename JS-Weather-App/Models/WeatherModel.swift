//
//  WeatherModel.swift
//  JS-Weather-App
//
//  Created by John Erick Santos on 9/4/2023.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Float

    var temperatureString: String {
        let formattedTemp = String(format: "%.1f", temperature)
        return formattedTemp + "°C"
    }

    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
