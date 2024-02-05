//
//  ImageUtilities.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/2/24.
//

import SwiftUI

struct APImage: View {
    
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
    }
}
