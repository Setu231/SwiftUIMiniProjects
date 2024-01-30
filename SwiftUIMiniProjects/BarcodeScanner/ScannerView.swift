//
//  ScannerView.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/29/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var scannerValue: String
    @Binding var alertItem: Bool
    @Binding var alertErrorData: CameraError
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) { }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.scannerValue = barcode
        }
        
        func didSurface(error: CameraError) {
            scannerView.alertItem = true
            scannerView.alertErrorData = .invalidDeviceInput
        }
    }
}
