//
//  ListAppleFrameworkView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/29/24.
//

import SwiftUI

struct ListAppleFrameworkView: View {
    
    @StateObject var appleFrameworkViewModel = AppleFrameworkViewModel()

    var body: some View {
        NavigationStack {
            List(MockData.frameworks, id: \.id) {frameworkDetail in
                NavigationLink(destination: DetailListFrameworkView(frameworkDetail: frameworkDetail, isDetailViewPresented: $appleFrameworkViewModel.isDetailViewPresented)) {
                    FrameworkCollectionView(frameworkItem: frameworkDetail, isVerticalStack: false)
                }
            }
            .listRowSeparator(.hidden, edges: .all)
            .listStyle(.plain)
            .navigationTitle("Apple Frameworks")
        }
    }
}

struct ListAppleFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        ListAppleFrameworkView()
    }
}
