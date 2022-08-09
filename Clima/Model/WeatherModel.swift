//
//  WeatherModel.swift
//  Clima
//
//  Created by Dmytro on 09.08.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel {
    var weather : [Weather]
    var main : [Main]
}

struct Weather {
    
    var id : Int
    var main : String
    var icon: String
}

struct Main {
    var temp :Double
}
