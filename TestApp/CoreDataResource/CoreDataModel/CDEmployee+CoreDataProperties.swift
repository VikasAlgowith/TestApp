//
//  CDEmployee+CoreDataProperties.swift
//  
//
//  Created by Vikas Kumar Srivastava on 15/11/21.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var employee_name: String?
    @NSManaged public var employee_age: Int64
    @NSManaged public var employee_salary: Int64

}
