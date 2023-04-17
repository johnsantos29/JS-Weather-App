//
//  WeatherManager.swift
//  JS-Weather-App
//
//  Created by John Erick Santos on 9/4/2023.
//

import CoreLocation
import Foundation
import SwiftUI

class WeatherManager: ObservableObject {
    @Published var weather: WeatherModel?
    @Published var showWeatherView = false
    @Published var inProgress = false

    func fetchWeatherData(cityName: String) {
        let openApiWeatherUrl = K.OpenWeather.getWeatherByCityUrl(cityName)

        fetchData(openApiWeatherUrl: openApiWeatherUrl)
    }

    func fetchWeatherData(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let openApiWeatherUrl = K.OpenWeather.getWeatherByLocUrl(latitude: latitude, longitude: longitude)

        fetchData(openApiWeatherUrl: openApiWeatherUrl)
    }

    func fetchData(openApiWeatherUrl: String) {
        if let url = URL(string: openApiWeatherUrl) {
            inProgress = true
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if error == nil {
                    let decoder = JSONDecoder()

                    if let safeData = data {
                        do {
                            let results = try decoder.decode(WeatherData.self, from: safeData)

                            let conditionId = results.weather[0].id
                            let cityName = results.name
                            let temperature = results.main.temp

                            DispatchQueue.main.async {
                                self.weather = WeatherModel(conditionId: conditionId, cityName: cityName, temperature: temperature)
                                self.showWeatherView = true
                                self.inProgress = false
                            }
                        } catch {
                            // TODO: do something when fetchData fails
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
