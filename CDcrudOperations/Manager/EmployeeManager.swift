//
//  EmployeeManager.swift
//  CDcrudOperations
//
//  Created by Sarika on 15.03.22.
//

import Foundation
import CoreData

struct EmployeeManager {
    
    private let _employeeDataRepository = EmployeeDataREpository()
    
    func createEmployee(employee : Employee) {
        _employeeDataRepository.create(employee: employee)
    }
    
    func deleteEmployee(employee : Employee) -> Bool {
        return _employeeDataRepository.delete(record: employee)
    }
    
    func updateEmployee(employee : Employee) -> Bool {
        return _employeeDataRepository.update(employee: employee)
    }
    
    func fetchEmployee() -> [Employee]? {
       return _employeeDataRepository.getAll()
    }
    
    func fetchEmployee(byIdentifier id: UUID) -> Employee? {
        return _employeeDataRepository.get(byIdentifier: id)
    }
}
