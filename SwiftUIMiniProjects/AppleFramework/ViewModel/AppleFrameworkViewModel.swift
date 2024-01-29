//
//  AppleFrameworkViewModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/23/24.
//

import Foundation

final class AppleFrameworkViewModel: ObservableObject {
    
    @Published var isDetailViewPresented = false
    
    var selectedFramework: Framework? {
        didSet {
            isDetailViewPresented = true
        }
    }
}
