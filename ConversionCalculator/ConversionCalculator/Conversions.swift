//
//  Conversions.swift
//  ConversionCalculator
//
//  Created by Alyssa Nielsen on 7/25/17.
//  Copyright © 2017 Alyssa Nielsen. All rights reserved.
//

import Foundation


public class Conversions {

    func convertCelciusToFahrenheit(_ degree: Double) -> Double {
        return degree * (9/5) + 32
    }
    
    func convertFahrenheitToCelcius(_ degree: Double) -> Double {
        return ((degree - 32) * 5)/9
    }
    
    func convertMilesToKilometers(_ distance:Double) -> Double {
        return distance * 1.609344
    }
    
    func convertKilometersToMiles(_ distance:Double) -> Double {
        return distance / 1.609344
    }
}
