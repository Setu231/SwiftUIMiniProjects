//
//  AppleFrameworkView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/22/24.
//

import SwiftUI

struct GridAppleFrameworkView: View {
    
    @StateObject var appleFrameworkViewModel = AppleFrameworkViewModel()

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false, content: {
                LazyVGrid(columns: appleFrameworkViewModel.columns) {
                    ForEach(MockData.frameworks, id: \.id) { frameworkDetail in
                        FrameworkCollectionView(frameworkItem: frameworkDetail)
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

struct FrameworkCollectionView: View {
    
    var frameworkItem: Framework
    
    var isVerticalStack = true
    
    var body: some View {
        if isVerticalStack {
            VStack {
                FrameworkCollectionInnerView(frameworkItem: frameworkItem)
            }
        } else {
            HStack {
                FrameworkCollectionInnerView(frameworkItem: frameworkItem)
            }
        }
    }
}

struct FrameworkCollectionInnerView: View {
    
    var frameworkItem: Framework
    
    var body: some View {
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

struct AppleFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        GridAppleFrameworkView()
    }
}
