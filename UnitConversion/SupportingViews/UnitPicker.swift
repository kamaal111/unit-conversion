//
//  UnitPicker.swift
//  UnitConversion
//
//  Created by Kamaal Farah on 16/11/2019.
//  Copyright © 2019 Kamaal. All rights reserved.
//

import SwiftUI

struct UnitPicker: View {
    @Binding var unitSelection: Int

    let unit: Units

    let unitTypes = UnitArray()


    func arrayCount() -> Int {
        switch unit {
        case .Temprature:
            return unitTypes.tempratureUnits.count
        }
    }

    func pickerText(in index: Int) -> String {
        switch unit {
            case .Temprature:
                return unitTypes.tempratureUnits[index].rawValue
        }
    }


    var body: some View {
        Picker("", selection: $unitSelection, content: {
            ForEach(0..<arrayCount()) {
                Text(self.pickerText(in: $0))
            }
        })
            .pickerStyle(SegmentedPickerStyle())
    }
}


