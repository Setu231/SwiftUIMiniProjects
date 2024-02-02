//
//  AdaptiveSwitchData+CoreDataProperties.swift
//  SwiftUIMiniProjects
//
//  Created by Setu Desai on 1/27/24.
//
//

import Foundation
import CoreData

extension AdaptiveSwitchData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AdaptiveSwitchData> {
        return NSFetchRequest<AdaptiveSwitchData>(entityName: "AdaptiveSwitchTable")
    }

    @NSManaged public var isSwitchOn: Bool
    @NSManaged public var dateOfAddition: Date?
    @NSManaged public var switchName: String?

}

extension AdaptiveSwitchData {
    static func getAllSwitchItems() -> NSFetchRequest<AdaptiveSwitchData> {
        let request: NSFetchRequest<AdaptiveSwitchData> = AdaptiveSwitchData.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "isSwitchOn", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}

extension AdaptiveSwitchData : Identifiable {

}
