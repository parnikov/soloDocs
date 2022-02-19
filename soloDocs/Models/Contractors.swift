//
//  Contractors.swift
//  soloDocs
//
//  Created by Parnikov Aleksey on 16.02.2022.
//

import CoreData

@objc(Contractors)
class Contractors: NSManagedObject {
    
    @NSManaged var id: NSNumber!
    @NSManaged var name: String!
    @NSManaged var preview: String!
}
