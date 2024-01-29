//
//  AdaptiveSwitchViewModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/28/24.
//

import Foundation

final class AdaptiveSwitchViewModel: ObservableObject {
    
    @Published var isSwitchOn: Bool = false
    
    var adaptiveData: AdaptiveSwitchData? {
        didSet {
            if let adaptiveData {
                isSwitchOn = !adaptiveData.isSwitchOn
            } else {
                isSwitchOn = false
            }
        }
    }
}
