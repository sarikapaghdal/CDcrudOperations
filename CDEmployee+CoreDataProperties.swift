//
//  CDEmployee+CoreDataProperties.swift
//  CDcrudOperations
//
//  Created by Sarika on 14.03.22.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var profilePic: Data?
    
    func convertToEmployee() -> Employee {
        let emp = Employee(name: self.name, email: self.email, profilePicture: self.profilePic, id: self.id!)
        return emp
    }

}

extension CDEmployee : Identifiable {

}
