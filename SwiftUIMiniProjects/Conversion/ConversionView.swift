//
//  ConversionView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/28/24.
//

import SwiftUI

struct ConversionView: View {
    
    @StateObject var conversionViewModel = ConversionViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .green, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                Circle()
                    .foregroundColor(Color.white)
                VStack{
                    Text("Conversion Calculator")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                    Spacer().frame(height: 25)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Conversion")
                                .foregroundColor(Color.black)
                            Picker("Select Conversion", selection: $conversionViewModel.categoryKey) {
                                Text("").tag("-1")
                                ForEach(conversionViewModel.pickerViewValues, id: \.self) { value in
                                    Text(value.pickerTitle ?? "").tag(value.pickerTitle)
                                        .foregroundColor(Color.black)
                                }
                            }
                            .tint(Color.black)
                        }
                        Spacer().frame(height: 25)
                        HStack {
                            Text("From: ")
                                .foregroundColor(Color.black)
                            TextField("Enter Value", text: $conversionViewModel.fromCategoryValue)
                        }
                        Spacer().frame(height: 25)
                        HStack {
                            Text("To: ")
                                .foregroundColor(Color.black)
                            Text($conversionViewModel.toValue.wrappedValue)
                        }
                    }.padding(22)
                    Button("Calculate") {
                        conversionViewModel.toValue = String(Double(conversionViewModel.pickerViewValues.first(where: { categoryKey in
                            conversionViewModel.categoryKey == categoryKey.pickerTitle
                        })?.pickerConversion ?? 0.0) * (Double(conversionViewModel.fromCategoryValue) ?? 0.0))
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(Color.black)
                }
            }.navigationTitle("🧮 Conversion")
        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
