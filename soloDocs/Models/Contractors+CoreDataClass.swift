//
//  Contractors+CoreDataClass.swift
//  soloDocs
//
//  Created by Parnikov Aleksey on 14.02.2022.
//
//

import Foundation
import CoreData

@objc(Contractors)
public class Contractors: NSManagedObject {
    @NSManaged public var id: NSNumber!
    @NSManaged public var name: String!
    @NSManaged public var preview: String!
}
