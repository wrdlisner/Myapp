//
//  Results+CoreDataProperties.swift
//  
//
//  Created by 袖川航平 on 2018/06/22.
//
//

import Foundation
import CoreData


extension Results {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Results> {
        return NSFetchRequest<Results>(entityName: "Results")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var question1: Int16
    @NSManaged public var question2: String?
    @NSManaged public var question3: String?
    @NSManaged public var question4: String?
    @NSManaged public var question5: String?
    @NSManaged public var viewDate: NSObject?

}
