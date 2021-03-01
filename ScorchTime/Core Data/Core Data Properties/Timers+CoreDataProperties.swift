//
//  Timers+CoreDataProperties.swift
//  ScorchTime
//
//  Created by Johan Sas on 16/02/2021.
//
//

import Foundation
import CoreData


extension Timers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Timers> {
        return NSFetchRequest<Timers>(entityName: "Timers")
    }

    @NSManaged public var job: String?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?


}

extension Timers : Identifiable {

}
