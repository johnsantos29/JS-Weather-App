//
//  ContentView.swift
//  JS-Weather-App
//
//  Created by John Erick Santos on 9/4/2023.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var cityName = ""
    @ObservedObject var weatherManager = WeatherManager()
    @ObservedObject var locationDataManager = LocationDataManager()

    let lightBackground = UIColor(red: 0.93, green: 0.94, blue: 0.95, alpha: 1.00)
    let darkBackground = UIColor(red: 0.17, green: 0.24, blue: 0.31, alpha: 1.00)

    // computed properties
    var opacity: Double {
        return colorScheme == .dark ? 0.1 : 0.8
    }

    var appBackgroundColor: UIColor {
        return colorScheme == .dark ? darkBackground : lightBackground
    }

    var textFieldBackgroundColor: Color {
        return colorScheme == .dark ? Color.gray : Color.white
    }

    var body: some View {
        ZStack {
            Color(uiColor: appBackgroundColor)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 100) {
                HStack {
                    Image(systemName: K.SFIcons.toCurrentLocation)
                        .font(.system(size: 35))
                        .onTapGesture {
                            if let lat = locationDataManager.lat, let lon = locationDataManager.lon {
                                weatherManager.fetchWeatherData(latitude: lat, longitude: lon)
                            }
                        }
                    TextField(K.TextPlaceholders.cityName, text: $cityName)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(textFieldBackgroundColor.opacity(opacity).cornerRadius(10))
                        .font(.custom(K.CustomFonts.appFontRegular, size: 22))
                        .multilineTextAlignment(.trailing)
                        .onSubmit {
                            if cityName.count > 0 {
                                weatherManager.fetchWeatherData(cityName: cityName)
                            }
                        }
                    Image(systemName: K.SFIcons.search)
                        .font(.system(size: 35))
                        .onTapGesture {
                            if cityName.count > 0 {
                                weatherManager.fetchWeatherData(cityName: cityName)
                            }
                        }
                }.padding(.horizontal)
                if weatherManager.inProgress {
                    ProgressView().progressViewStyle(CircularProgressViewStyle())
                } else if weatherManager.showWeatherView {
                    if let weather = weatherManager.weather {
                        WeatherView(weather: weather)
                    }
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
