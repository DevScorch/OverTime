//
//  Jobs+CoreDataProperties.swift
//  ScorchTime
//
//  Created by Johan Sas on 17/02/2021.
//
//

import Foundation
import CoreData


extension Jobs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Jobs> {
        return NSFetchRequest<Jobs>(entityName: "Jobs")
    }

    @NSManaged public var title: String?
    @NSManaged public var id: UUID?

}

extension Jobs : Identifiable {

}
