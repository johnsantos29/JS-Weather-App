//
//  WeatherView.swift
//  JS-Weather-App
//
//  Created by John Erick Santos on 9/4/2023.
//

import SwiftUI

struct WeatherView: View {
    let weather: WeatherModel

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weather.conditionName)
                .font(.system(size: 130))
            Text(weather.temperatureString)
                .font(.custom(K.CustomFonts.appFontExtraBold, size: 60))
            Text(weather.cityName)
                .font(.custom(K.CustomFonts.appFontSemiBold, size: 50))
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: WeatherModel(conditionId: 500, cityName: "Sydney", temperature: 14.4))
    }
}
