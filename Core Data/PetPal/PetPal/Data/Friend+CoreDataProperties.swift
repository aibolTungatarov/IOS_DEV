//
//  Friend+CoreDataProperties.swift
//  PetPal
//
//  Created by Aibol Tungatarov on 8/18/19.
//  Copyright © 2019 Razeware. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var dob: NSDate?
    @NSManaged public var eyeColor: NSObject?
    @NSManaged public var photo: NSData?

}
