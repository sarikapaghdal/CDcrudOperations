//
//  EmployeeDataRepository.swift
//  CDcrudOperations
//
//  Created by Sarika on 14.03.22.
//

import Foundation
import CoreData

protocol EmployeeRepository {
    
    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee : Employee) -> Bool
    func delete(record: Employee) ->Bool
    
}

struct EmployeeDataREpository : EmployeeRepository {
    func create(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.email = employee.email
        cdEmployee.name = employee.name
        cdEmployee.id = employee.id
        cdEmployee.profilePic = employee.profilePicture
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        
        var employee : [Employee] = []
        
        result?.forEach({ cdEmployee in
            employee.append(cdEmployee.convertToEmployee())
        })
        
        return employee
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
       let result = getCDEmployee(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToEmployee()
    }
    
    func update(employee: Employee) -> Bool {
        return true
    }
    
    func delete(record: Employee) -> Bool {
        return false
    }
    
    private func getCDEmployee(byIdentifier id: UUID) -> CDEmployee? {
        
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {return nil}
            return result
            
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
}
