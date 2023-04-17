//
//  Constants.swift
//  JS-Weather-App
//
//  Created by John Erick Santos on 9/4/2023.
//

import CoreLocation
import Foundation

struct K {
    enum TextPlaceholders {
        static let cityName = "Enter city name"
    }

    enum SFIcons {
        static let toCurrentLocation = "location.circle"
        static let search = "magnifyingglass"
    }

    enum CustomFonts {
        static let appFontRegular = "Montserrat-VariableFont_wght"
        static let appFontExtraBold = "Montserrat-ExtraBold"
        static let appFontSemiBold = "Montserrat-SemiBold"
    }

    enum OpenWeather {
        // TODO: replace API Key
        static let baseUrl = "https://api.openweathermap.org/data/2.5/weather?&appid=80b1020cc854a9c31d849bbfb357ea19&units=metric"

        static func getWeatherByCityUrl(_ cityName: String) -> String {
            let encodedCityName = cityName.replacingOccurrences(of: " ", with: "%20")

            return "\(K.OpenWeather.baseUrl)&q=\(encodedCityName)"
        }

        static func getWeatherByLocUrl(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> String {
            return "\(K.OpenWeather.baseUrl)&lat=\(latitude)&lon=\(longitude)"
        }
    }
}
