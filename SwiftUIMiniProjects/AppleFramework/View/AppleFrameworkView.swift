//
//  AppleFrameworkView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/22/24.
//

import SwiftUI

struct AppleFrameworkView: View {
    
    @StateObject var appleFrameworkViewModel = AppleFrameworkViewModel()
    
    var columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false, content: {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks, id: \.id) { frameworkDetail in
                        FrameworkGridView(frameworkItem: frameworkDetail)
                            .onTapGesture {
                                appleFrameworkViewModel.selectedFramework = frameworkDetail
                            }
                    }
                }
            }).navigationTitle("Apple Frameworks")
                .sheet(isPresented: $appleFrameworkViewModel.isDetailViewPresented) {
                    DetailFrameworkView(frameworkDetail: appleFrameworkViewModel.selectedFramework ?? MockData.sampleFramework, isDetailViewPresented: $appleFrameworkViewModel.isDetailViewPresented)
                }
        }
    }
}

struct FrameworkGridView: View {
    
    var frameworkItem: Framework
    
    var body: some View {
        VStack {
            Image(frameworkItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
            
            Text(frameworkItem.name)
                .font(.title2)
                .fontWeight(.medium)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}

struct AppleFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        AppleFrameworkView()
    }
}
