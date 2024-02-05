//
//  AppetizerView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/30/24.
//

import SwiftUI

struct AppetizerView: View {
    
    @StateObject var appetizerViewModel = AppetizerViewModel()
    @State private var isDetailViewShowing = false
    @State var selectedAppetizer: Appetizer?
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(appetizerViewModel.appetizerList) { eachAppetizer in
                        AppetizerListCellView(appetizer: eachAppetizer)
                            .onTapGesture {
                                isDetailViewShowing = true
                                selectedAppetizer = eachAppetizer
                            }
                    }
                }
                .disabled(isDetailViewShowing)
                .navigationTitle("🍟 Appetizers")
                .listStyle(PlainListStyle())
            }
            .task {
                appetizerViewModel.isLoading = true
                appetizerViewModel.fetchDataCall()
            }
            .blur(radius: isDetailViewShowing ? 20 : 0)
            
            if isDetailViewShowing {
                AppetizerDetailView(appetizer: selectedAppetizer ?? Appetizer(), isShowingDetail: $isDetailViewShowing)
            }
            
            if appetizerViewModel.isLoading {
                ProgressView()
            }
        }
    }
}

struct AppetizerListCellView: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerImageView(urlString: appetizer.imageURL ?? "")
                .foregroundColor(Color.appetizerBrandColor)
                .scaledToFit()
                .cornerRadius(8)
                .frame(width: 120, height: 90)
            VStack(alignment: .leading, spacing: 8) {
                Text(appetizer.name ?? "")
                    .font(.headline)
                    .fontWeight(.light)
                Text("$\(appetizer.price ?? 0.0, specifier: "%.2f")")
                    .font(.footnote)
                    .fontWeight(.light)
                Spacer()
            }.padding(8)
        }
    }
}

struct AppetizerImageView: View {
    @StateObject var appetizerImageViewModel = AppetizerImageModel()
    var urlString: String
    
    var body: some View {
        Image(uiImage: appetizerImageViewModel.appetizerImage)
            .resizable()
            .task {
                appetizerImageViewModel.getAppetizerImage(urlString: urlString)
            }
    }
}

struct AppetizerDetailView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            AppetizerImageView(urlString: appetizer.imageURL ?? "")
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 225)
            VStack {
                Text(appetizer.name ?? "")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description ?? "")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 50) {
                    VStack(spacing: 5) {
                            Text("Calorie")
                            .bold()
                            .font(.caption)
                        
                            Text(String(appetizer.calories ?? 0))
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                        }
                    
                    VStack(spacing: 5) {
                        Text("Carbs")
                            .bold()
                            .font(.caption)
                        
                        Text(String(appetizer.carbs ?? 0))
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    
                    VStack(spacing: 5) {
                        Text("Protien")
                            .bold()
                            .font(.caption)
                        
                        Text(String(appetizer.protein ?? 0))
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
            }
            Spacer()
            Button {
                orderViewModel.addItems(of: appetizer)
                isShowingDetail = false
            } label: {
                Text("$\(appetizer.price ?? 0.0, specifier: "%.2f") Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color.appetizerBrandColor)
                    .cornerRadius(10)
            }
            .padding(.bottom, 30)
        }.frame(width: 320, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(alignment: .topTrailing) {
                Button {
                    isShowingDetail = false
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                            .opacity(0.6)
                        Image(systemName: "xmark")
                            .foregroundColor(Color.black)
                            .frame(width: 44, height: 44)
                    }
                }

            }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerView()
    }
}
