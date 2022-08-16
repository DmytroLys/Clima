//
//  WeatherModel.swift
//  Clima
//
//  Created by Dmytro on 09.08.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel : Decodable {
    var weather : [Weather]
    var main : Main
    var name : String
}

struct Weather: Decodable {
    
    var id : Int
    var main : String
    var icon: String
}

struct Main :Decodable {
    var temp : Double
}
