//
//  ContentView.swift
//  UnitConversion
//
//  Created by Kamaal Farah on 16/11/2019.
//  Copyright © 2019 Kamaal. All rights reserved.
//


import SwiftUI


struct ContentView: View {

    @State private var firstUnitSelection = 0
    @State private var secondUnitSelection = 1

    @State private var conversionField = ""

    @State private var unitType: Units = .Temprature
    
    var unitArray: [Any] {
        switch unitType {
        case .Temprature:
            let units = UnitArray()
            return units.tempratureUnits
        }
    }


    var conversionOutput: Double {
        let input = Double(conversionField) ?? 0
        return convert(
            unit: unitType,
            this: input, from: unitArray[firstUnitSelection],
            to: unitArray[secondUnitSelection]
        )
    }


    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("From")
                    UnitPicker(unitSelection: $firstUnitSelection, unit: unitType)

                    TextField("Input", text: $conversionField)
                        .keyboardType(UIKeyboardType.decimalPad)
                    
                    Text("To")
                    UnitPicker(unitSelection: $secondUnitSelection, unit: unitType)

                    Text("Output: \(conversionOutput, specifier: "%.2f")")
                }
            }
        .navigationBarTitle("UnitConversion")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
