//
//  AppleFrameworkViewModel.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/23/24.
//

import SwiftUI

final class AppleFrameworkViewModel: ObservableObject {
    
    @Published var isDetailViewPresented = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var selectedFramework: Framework? {
        didSet {
            isDetailViewPresented = true
        }
    }
}
