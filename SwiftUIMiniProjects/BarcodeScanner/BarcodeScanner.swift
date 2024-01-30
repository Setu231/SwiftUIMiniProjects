//
//  BarcodeScanner.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/29/24.
//

import SwiftUI

struct BarcodeScanner: View {
    
    @State private var scannedBarcodeValue = ""
    @State private var isAlertShown = false
    @State private var isAlertData = CameraError.noError
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannerValue: $scannedBarcodeValue, alertItem: $isAlertShown, alertErrorData: $isAlertData)
                    .frame(width: nil, height: 300)
                
                Spacer().frame(height: 40)
                
                Label("Barcode Scanner", systemImage: "barcode.viewfinder")
                    .font(.title)
                Spacer().frame(height: 50)
                Text(scannedBarcodeValue.isEmpty ? "Not Yet Scanned" : scannedBarcodeValue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(scannedBarcodeValue.isEmpty ? Color.red : Color.green)
                
            }.navigationTitle("Barcode Scanner")
                .alert(isPresented: $isAlertShown) {
                    Alert(title: Text(isAlertData.title),
                          message: Text(isAlertData.rawValue),
                          dismissButton: .default(Text("Ok")))
                }
        }
    }
}

struct BarcodeScanner_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScanner()
    }
}
