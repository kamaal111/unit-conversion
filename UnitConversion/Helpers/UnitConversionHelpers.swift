//
//  UnitConversionHelpers.swift
//  UnitConversion
//
//  Created by Kamaal Farah on 16/11/2019.
//  Copyright © 2019 Kamaal. All rights reserved.
//


enum Temprature: String {
    case
    Celsius,
    Fahrenheit,
    Kelvin
}


enum Units {
    case Temprature
}


struct UnitArray {
    let tempratureUnits: [Temprature] = [
        .Celsius,
        .Fahrenheit,
        .Kelvin
    ]
}


func convert(unit: Units, this input: Double, from originalUnit: Any, to conversionUnit: Any) -> Double {
    switch unit {
    case .Temprature:
        switch originalUnit {
        case Temprature.Celsius:
            switch conversionUnit {
            case Temprature.Celsius:
                return input
            case Temprature.Fahrenheit:
                return (input * 1.8) + 32
            case Temprature.Kelvin:
                return input + 273.15
            default:
                return 0
            }
        case Temprature.Fahrenheit:
            switch conversionUnit {
            case Temprature.Fahrenheit:
                return input
            case Temprature.Celsius:
                return (input - 32) * 0.5556
            case Temprature.Kelvin:
                return (input + 459.67) * 0.5556
            default:
                return 0
            }
        case Temprature.Kelvin:
            switch conversionUnit {
            case Temprature.Kelvin:
                return input
            case Temprature.Celsius:
                return input - 273.15
            case Temprature.Fahrenheit:
                return 1.8 * (input - 273.15) + 32
            default:
                return 0
            }
        default:
            return 0
        }
    }
}
