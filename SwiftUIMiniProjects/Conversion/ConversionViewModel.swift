//
//  ConversionViewModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/30/24.
//

import Foundation

struct Conversion: Hashable {
    var pickerTitle: String?
    var pickerConversion: Double?
}

final class ConversionViewModel: ObservableObject {
    
    @Published var categoryKey: String?
    @Published var toValue = ""
    @Published var fromCategoryValue = ""
    
    var pickerViewValues = [Conversion(pickerTitle: "lbs to kgs",
                                       pickerConversion: 0.453592),
                            Conversion(pickerTitle: "kgs to lbs",
                                       pickerConversion: 2.20462)]
}
