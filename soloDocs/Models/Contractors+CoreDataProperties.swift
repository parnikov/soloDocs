//
//  Contractors+CoreDataProperties.swift
//  soloDocs
//
//  Created by Parnikov Aleksey on 14.02.2022.
//
//

import Foundation
import CoreData


extension Contractors {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contractors> {
        return NSFetchRequest<Contractors>(entityName: "Contractors")
    }

    @NSManaged public var id: Int32!
    @NSManaged public var name: String!
    @NSManaged public var preview: String!

}

extension Contractors : Identifiable {

}
