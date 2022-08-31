//
//  WeatherManager.swift
//  Clima
//
//  Created by Dmytro on 09.08.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    
    var delegate : WeatherManagerDelegate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9dd04e42b8d5992cf994551684c493ad&units=metric"
    
    func fetchWeater (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        
        
    }
    
    func performRequest(urlString : String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                } else {
                    if let safeData = data {
                        if let weather = parseJson(weatherData: safeData) {
                            delegate?.didUpdateWeather(weather:weather)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJson(weatherData : Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather)
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
}
