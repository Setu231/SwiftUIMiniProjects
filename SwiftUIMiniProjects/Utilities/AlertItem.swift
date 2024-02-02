//
//  AlertItem.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 2/1/24.
//

import Foundation

enum AlertItem: String {
    //Camera Error
    case invalidDeviceInput
    case invalidScannedValue
    
    //Appetizer Error
    case invalidEmail
    case notFullyFilled
    case noError
    
    var title: String {
        switch self {
        case .invalidDeviceInput: return "Invalid Input"
        case .invalidScannedValue: return "Invalid Scanner Value"
        case .invalidEmail: return "Invalid Email Address"
        case .notFullyFilled: return "All Information Not Filled"
        default: return ""
        }
    }
    
    var message: String {
        switch self {
        case .invalidDeviceInput: return "Something is wrong with the camera"
        case .invalidScannedValue: return "Something is wrong with the scanned barcode"
        case .invalidEmail: return "The email you have added is not a valid email address"
        case .notFullyFilled: return "You have not filled out all the required details"
        default: return ""
        }
    }
}
